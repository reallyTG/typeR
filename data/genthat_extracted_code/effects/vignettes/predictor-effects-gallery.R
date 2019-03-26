## ----setopts,echo=FALSE---------------------------------------------
library("knitr")
opts_chunk$set(fig.width=5,fig.height=5,#tidy=TRUE,
               out.width="0.8\\textwidth",echo=TRUE)
#options(prompt=" ")
options(continue="+    ", prompt="R> ", width=70)
options(show.signif.stars=FALSE, scipen=3)

## ----setup, include=FALSE, cache=FALSE, results='hide', echo=FALSE------------
library(car)
library(effects)
render_sweave()
options(width=80, digits=5, str=list(strict.width="cut"))
strOptions(strict.width="cut")

## -----------------------------------------------------------------------------
library("car") # also loads the carData package
Prestige$type <- factor(Prestige$type, levels=c("bc", "wc", "prof"))
lm1 <- lm(prestige ~ education + poly(women, 2) +
                     log(income)*type, data=Prestige)

## -----------------------------------------------------------------------------
S(lm1)

## ----fig11,include=TRUE,fig.width=5,fig.height=4,fig.show='hide'--------------
library("effects")
e1.lm1 <- predictorEffect("education", lm1)
plot(e1.lm1)

## -----------------------------------------------------------------------------
brief(e1.lm1$model.matrix)

## -----------------------------------------------------------------------------
e1a.lm1 <- predictorEffect("education", lm1, focal.levels=5)
e1a.lm1
summary(e1a.lm1)
as.data.frame(e1a.lm1)

## -----------------------------------------------------------------------------
e2.lm1 <- predictorEffect("income", lm1, focal.levels=5)
as.data.frame(e2.lm1)

## ----fig12,include=TRUE,fig.width=5,fig.height=5,fig.show='hide'--------------
plot(predictorEffect("income", lm1), 
     lines=list(multiline=TRUE))

## ----fig13,include=TRUE,fig.width=5,fig.height=5,fig.show='hide'--------------
plot(predictorEffect("type", lm1), lines=list(multiline=TRUE))

## ----fig14,include=TRUE,fig.width=7,fig.height=8,fig.show='hide'--------------
eall.lm1 <- predictorEffects(lm1)
plot(eall.lm1)

## ----eval=FALSE---------------------------------------------------------------
#  plot(eall.lm1)
#  plot(predictorEffects(lm1))
#  plot(predictorEffects(lm1, ~ income + education + women + type))

## ----eval=FALSE---------------------------------------------------------------
#  plot(predictorEffects(lm1, ~ type + education))

## ----eval=FALSE---------------------------------------------------------------
#  plot(predictorEffects(lm1, ~ women))
#  plot(predictorEffects(lm1)[[3]])
#  plot(predictorEffect("women", lm1))

## ----fig21a,include=TRUE,fig.width=5,fig.height=4.5,fig.show='hide'-----------
e3.lm1 <- predictorEffect("type", lm1)
plot(e3.lm1, lines=list(multiline=TRUE))

## ----fig21b,include=TRUE,fig.width=6,fig.height=5,fig.show='hide'-------------
plot(e3.lm1, lines=list(multiline=FALSE)) # the default

## ----fig22a,include=TRUE,fig.width=5,fig.height=4.5,fig.show='hide'-----------
e3.lm1 <- predictorEffect("type", lm1,
                          xlevels=list(income=c(5000, 15000, 25000)))
plot(e3.lm1, lines=list(multiline=TRUE),
     confint=list(style="bars"))

## ----fig22b,include=TRUE,fig.width=5.5,fig.height=5,fig.show='hide'-----------
plot(e3.lm1,
     lines=list(multiline=FALSE), # the default
     lattice=list(layout=c(3, 1)))

## ----fig23,include=TRUE,fig.width=5,fig.height=4,fig.show='hide'--------------
e4.lm1 <- predictorEffect("education", lm1,
                          se=list(type="scheffe", level=.99), 
                          vcov.=hccm)
plot(e4.lm1)

## -----------------------------------------------------------------------------
lm2 <- lm(log(prestige) ~ log(income) + education + type, Prestige)

## ----fig30,include=TRUE,fig.width=5,fig.height=4,fig.show='hide'--------------
plot(predictorEffects(lm2, ~ income))

## ----fig31,include=TRUE,fig.width=5,fig.height=4,fig.show='hide'--------------
plot(predictorEffects(lm2, ~ income),
 axes=list(
   x=list(income=list(transform=list(trans=log, inverse=exp)))
   ))

## ----fig32,include=TRUE,fig.width=5,fig.height=5,fig.show='hide'--------------
plot(predictorEffects(lm2, ~ income),
 main="Transformed Plot",
 axes=list(
    grid=TRUE,
    x=list(rotate=30,
           rug=FALSE,
           income=list(transform=list(trans=log, inverse=exp),
                       lab="income, log-scale",
                       ticks=list(at=c(2000, 5000, 10000, 20000)),
                       lim=c(1900, 21000))
    )))

## ----fig33,include=TRUE,fig.width=4,fig.height=4,fig.show='hide'--------------
# default:
plot(predictorEffects(lm2, ~ education),
     main="Default log(prestige)")
# Change only tick-mark labels to arithmetic scale:
plot(predictorEffects(lm2, ~ education),
     main="log(prestige), Arithmetic Ticks",
     axes=list(y=list(transform=list(trans=log, inverse=exp),
                      lab="prestige", type="rescale")))
# Replace log(presige) by prestige:
plot(predictorEffects(lm2, ~ education),
     main="Prestige in Arithmethic Scale",
     axes=list(y=list(transform=exp, lab="prestige")))

## -----------------------------------------------------------------------------
library("lme4") # for lmer()
Blackmore$tran.exercise <- bcnPower(Blackmore$exercise, 
                                    lambda=0.25, gamma=0.1)
mm1 <- lmer(tran.exercise ~ I(age - 8)*group +
              (I(age - 8) | subject), data=Blackmore)

## ----fig33a,include=TRUE,fig.width=5,fig.height=5,fig.show='hide'-------------
e1.mm1 <- predictorEffect("age", mm1)
plot(e1.mm1, lines=list(multiline=TRUE), confint=list(style="auto"))

## ----fig33b,include=TRUE,fig.width=5,fig.height=5,fig.show='hide'-------------
f.trans <- function(x) bcnPower(x, lambda=0.25, gamma=0.1)
f.inverse <- function(x) bcnPowerInverse(x, lambda=0.25, gamma=0.1)
plot(e1.mm1, lines=list(multiline=TRUE),
     confint=list(style="auto"),
     axes=list(x=list(age=list(lab="Age (years)")),
               y=list(transform=list(trans=f.trans, inverse=f.inverse),
                      type="response",
                      lab="Exercise (hours/week)")),
     lattice=list(key.args=list(x=.20, y=.75, corner=c(0, 0), 
                                padding.text=1.25)),
     main=""
)

## -----------------------------------------------------------------------------
data("Blowdown", package="alr4")
gm1 <- glm(y ~ log(d) + s + spp, family=binomial, data=Blowdown)

## ----fig34,include=TRUE,fig.width=6.5,fig.height=6.5,fig.show='hide'----------
plot(predictorEffects(gm1),
     axes=list(grid=TRUE, x=list(rug=FALSE, rotate=35)))

## ----fig35,include=TRUE,fig.width=3.5,fig.height=3.5,fig.show='hide'----------
e1.gm1 <- predictorEffect("spp", gm1)
plot(e1.gm1, main="type='rescale'",
     axes=list(y=list(type="rescale",
                      lab="logit scale, probability labels"),
               x=list(rotate=30),
               grid=TRUE))
plot(e1.gm1, main="type='link'",
     axes=list(y=list(type="link",
                      lab="logit scale, logit labels"),
               x=list(rotate=30),
               grid=TRUE))
plot(e1.gm1, main="type='response'",
     axes=list(y=list(type="response", grid=TRUE,
                      lab="probabilty scale, probability labels"),
               x=list(rotate=30),
               grid=TRUE))

## ----fig36,include=TRUE,fig.width=5.5,fig.height=4.5,fig.show='hide'----------
or <- order(as.data.frame(e1.gm1)$fit) # order smallest to largest
Blowdown$spp1 <- factor(Blowdown$spp,  # reorder levels of spp
                        levels=levels(Blowdown$spp)[or])
gm2 <- update(gm1, ~ . - spp + spp1)   # refit model
plot(predictorEffects(gm2, ~ spp1), main="type='response', ordered",
     axes=list(y=list(type="response",
                      lab="probabilty scale, probability labels"),
               x=list(rotate=30, spp=list(lab="Species")),
               grid=TRUE))

## ----fig37,include=TRUE,fig.width=9,fig.height=12,fig.show='hide'-------------
gm3 <- update(gm2, ~ . + s:log(d)) # add an interaction
plot(predictorEffects(gm3, ~ s + d),
     axes=list(x=list(rug=FALSE, rotate=90),
               y=list(type="response", lab="Blowdown Probability")),
     lattice=list(layout=c(1, 5)))

## ----fig38,include=TRUE,fig.width=9,fig.height=5,fig.show='hide'--------------
plot(predictorEffects(gm3, ~ s + d, xlevels=list(d=c(5, 40, 80),
                                                 s=c(0.1, 0.5, 0.9))),
     axes=list(grid=TRUE,
               x=list(rug=FALSE),
               y=list(type="response", lab="Blowdown probability")),
     lines=list(multiline=TRUE))

## ----fig39,include=TRUE,fig.width=7,fig.height=7,fig.show='hide'--------------
gm4 <- update(gm3, ~ . + spp:log(d))
plot(predictorEffects(gm4, ~ d, xlevels=list(s=c(0.1, 0.5, 0.9))),
     axes=list(grid=TRUE,
               y=list(type="response"),
               x=list(rug=FALSE)),
     lines=list(multiline=TRUE))

## ----fig310,include=TRUE,fig.width=7,fig.height=5,fig.show='hide'-------------
plot(predictorEffects(gm4, ~ d, xlevels=list(s=c(0.1, 0.5, 0.9))),
     axes=list(grid=TRUE, 
               y=list(type="response"), 
               x=list(rug=FALSE)),
     lines=list(multiline=TRUE, z.var="spp", lty=1:9),
     lattice=list(layout=c(3, 1)))

## ----fig311,include=TRUE,fig.width=5.5,fig.height=5.5,fig.show='hide'---------
plot(predictorEffects(gm3, ~ d, 
                      xlevels=list(s=c(0.1, 0.5, 0.9))),
     axes=list(grid=TRUE,
               x=list(rug=FALSE),
               y=list(type="response")),
     lines=list(multiline=TRUE),
     confint=list(style="auto"))

## ----fig312,include=TRUE,fig.width=7,fig.height=6,fig.show='hide'-------------
gm5 <- update(gm2, ~ . + spp:s)
plot(predictorEffects(gm5, ~ spp, xlevels=list(s=c(0.1, 0.5, 0.9))),
     axes=list(grid=TRUE,
               y=list(type="response"),
               x=list(rug=FALSE, rotate=30)),
     lines=list(multiline=TRUE),
     confint=list(style="auto"))

## ----fig314,include=TRUE,fig.width=8,fig.height=6,fig.show='hide'-------------
plot(predictorEffects(gm5, ~ spp, xlevels=list(s=c(0.1, 0.5, 0.9))),
     rug=FALSE,
     axes=list(grid=TRUE,
               y=list(type="response"),
               x=list(rotate=30)),
     lines=list(multiline=TRUE),
     confint=list(style="auto"),
     lattice=list(key.args=list(space="right",
                                columns=1,
                                border=TRUE,
                                fontfamily="serif",
                                cex=1.25,
                                cex.title=1.5)))

## ----fig313,include=TRUE,fig.width=13,fig.height=5.5,fig.show='hide'----------
plot(predictorEffects(gm3, ~ s + d, xlevels=list(s=6, d=6)),
     axes=list(x=list(rug=FALSE, rotate=90), 
               y=list(ticks=list(at=c(.999, .99, .95, .8, .5, .2, .05)))),
     lattice=list(layout=c(3, 2)))

## ----fig313b,include=TRUE,fig.width=6,fig.height=10,fig.show='hide'-----------
plot(predictorEffect("s", gm3, xlevels=list(d=6)),
     axes=list(x=list(rug=FALSE, rotate=90),  
               y=list(ticks=list(at=c(.999, .99, .95, .8, .5, .2, .05)))),
     lattice=list(layout=c(3, 2),
                  array=list(row=1, col=1, nrow=2, ncol=1, more=TRUE)))
plot(predictorEffect("d", gm3, xlevels=list(s=6)),
     axes=list(x=list(rug=FALSE, rotate=90),  
               y=list(ticks=list(at=c(.999, .99, .95, .8, .5, .2, .05)))),
     lattice=list(layout=c(3, 2),
                  array=list(row=2, col=1, nrow=2, ncol=1, more=FALSE)))

## ----fig316,include=TRUE,fig.width=7,fig.height=5,fig.show='hide'-------------
plot(predictorEffects(gm4, ~ d, xlevels=list(s=c(0.1, 0.5, 0.9))),
     axes=list(grid=TRUE,
               x=list(rug=FALSE),
               y=list(type="response")),
     lines=list(multiline=TRUE, z.var="spp", lty=1:9),
     lattice=list(layout=c(3, 1),
                  strip=list(factor.names=TRUE,
                             values=TRUE,
                             cex=1.5)))

## ----fig315,include=TRUE,fig.width=7,fig.height=6,fig.show='hide'-------------
gm5 <- update(gm2, ~ . + spp:s)
plot(predictorEffects(gm5, ~ spp, xlevels=list(s=c(0.1, 0.5, 0.9))),
     symbols=list(pch=15:17, cex=1.5),
     axes=list(grid=TRUE,
               y=list(type="response"),
               x=list(rotate=30)),
     lines=list(multiline=TRUE),
     confint=list(style="auto"),
     lattice=list(key.args=list(cex=1.5, cex.title=1.5)))

## ----fig51,include=TRUE,fig.width=10,fig.height=9,fig.show='hide'-------------
lm5 <- lm(prestige ~ log(income) + education + women + type,
          Prestige)
plot(predictorEffects(lm5, residuals=TRUE),
     axes=list(grid=TRUE,
               x=list(rotate=30)),
     partial.residuals=list(smooth=TRUE,
                            span=0.75,
                            lty="dashed"))

## ----fig52,include=TRUE,fig.width=10,fig.height=5,fig.show='hide'-------------
options(scipen=10) # suppress scientific notation 
lm6 <- lm(infantMortality ~ group*ppgdp, data=UN)
plot(predictorEffects(lm6, ~ ppgdp, partial.residuals=TRUE),
     axes=list(x=list(rotate=25), 
               y=list(lim=c(0, 150))),
    id=list(n=1),
    lattice=list(layout=c(3, 1)))

## ----fig53,include=TRUE,fig.width=10,fig.height=5,fig.show='hide'-------------
lm7 <- lm(log(infantMortality) ~ group*log(ppgdp), data=UN)
plot(predictorEffects(lm7, ~ ppgdp, partial.residuals=TRUE),
     axes=list(x=list(rotate=25)),
     id=list(n=1),
     lattice=list(layout=c(3, 1)))

## ----fig54,include=TRUE,fig.width=10,fig.height=5,fig.show='hide'-------------
plot(predictorEffects(lm7, ~ ppgdp, partial.residuals=TRUE),
     axes=list(x=list(rotate=25),
               y=list(transform=list(trans=log, inverse=exp),
                      type="response",
                      lab="Infant Mortality")),
     id=list(n=1),
     lattice=list(layout=c(3, 1)))

## -----------------------------------------------------------------------------
S(lm2)

## ----fig55,include=TRUE,fig.width=8,fig.height=4,fig.show='hide'--------------
plot(Effect(c("income", "type"), lm2, residuals=TRUE),
     axes=list(x=list(rotate=30)),
     partial.residuals=list(span=0.9), 
     layout=c(3, 1))

## -----------------------------------------------------------------------------
library("MASS") # for polr()
Womenlf$partic <- factor(Womenlf$partic,
    levels=c("not.work", "parttime", "fulltime")) # order response levels
or1 <- polr(partic ~ log(hincome) + children, data=Womenlf)
S(or1)

## ----fig41,include=TRUE,fig.width=6.5,fig.height=6.5,fig.show='hide'----------
plot(predictorEffects(or1),
     axes=list(grid=TRUE),
     lattice=list(key.args=list(columns=1)))

## ----fig62,include=TRUE,fig.width=6,fig.height=4,fig.show='hide'--------------
plot(predictorEffects(or1),
     axes=list(grid=TRUE, y=list(style="stacked")),
     lattice=list(key.args=list(columns=1)))

## -----------------------------------------------------------------------------
library("nnet") # for multinom()
mr1 <- multinom(vote ~ age + gender + economic.cond.national +
                       economic.cond.household + Blair + Hague + Kennedy +
                       Europe*political.knowledge, data=BEPS)

## ----fig42,include=TRUE,fig.width=6.5,fig.height=6.5,fig.show='hide'----------
plot(predictorEffects(mr1, ~ age + Blair + Hague + Kennedy),
     axes=list(grid=TRUE, x=list(rug=FALSE)),
     lattice=list(key.args=list(columns=1)),
     lines=list(multiline=TRUE, col=c("blue", "red", "orange")))

## ----fig43,include=TRUE,fig.width=10,fig.height=5,fig.show='hide'-------------
plot(predictorEffects(mr1, ~ Europe + political.knowledge,
                      xlevels=list(political.knowledge=0:3,
                                   Europe=c(1, 6, 11))),
     axes=list(grid=TRUE, 
               x=list(rug=FALSE, 
                      Europe=list(ticks=list(at=c(1, 6, 11))),
                      political.knowledge=list(ticks=list(at=0:3))),
               y=list(style="stacked")),
     lines=list(col=c("blue", "red", "orange")),
     lattice=list(key.args=list(columns=1),
                  strip=list(factor.names=FALSE)))

## ----eval=FALSE---------------------------------------------------------------
#  effectsTheme()

