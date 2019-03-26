## ----preliminaries, echo=FALSE, warning = FALSE, message = FALSE, results='hide'----
require("RATest")
knitr::render_sweave()
options(prompt = "R> ", continue = "+  ", digits = 2, show.signif.stars = FALSE)
cleanup <- FALSE

## ----panel.asetup, include=FALSE-----------------------------------------
panel.a.cap = "Candidate's probability of winning election $t+1$, by margin of victory in election $t$: local averages and logit polynomial fit"

## ----panel.a, fig.height = 4, fig.width = 10, fig.cap = panel.a.cap, echo=FALSE, warning=FALSE----
lee2008$d<- ifelse(lee2008$difdemshare >= 0,1,0)

# Predict with local polynomial logit of degree 4
logit.a   <- glm(formula = demsharenext ~ poly(difdemshare, degree = 4) +
                 poly(difdemshare, degree = 4) * d,
               family  = binomial(link = "logit"),
               data    = lee2008)
lee2008$demsharenexthat<-predict(logit.a, lee2008, type = "response")

# Create local average by 0.005 interval of the running variable (share)
breaks  <- round(seq(-1, 1, by = 0.005), 3)
lee2008$i005<-as.numeric(as.character(cut(lee2008$difdemshare,
                                          breaks = breaks,
                                          labels = head(breaks, -1),
                                          right  = TRUE)))


m_next<-tapply(lee2008$demsharenext,lee2008$i005,mean)
m_next<-data.frame(i005=rownames(m_next), m_next=m_next)
mp_next<-tapply(lee2008$demsharenexthat,lee2008$i005,mean)
mp_next<-data.frame(i005=rownames(mp_next), mp_next=mp_next)
panel.a<-merge(m_next,mp_next,by=c("i005"), all=T)
panel.a$i005<-as.numeric(as.character(panel.a$i005))


# Plot panel (a)
panel.a <- panel.a[which(panel.a$i005 > -0.251 & panel.a$i005 < 0.251), ]
plot.a  <- ggplot(data = panel.a, aes(x = i005))                       +
  geom_point(aes(y = m_next))                                 +
  geom_line(aes(y = mp_next, group = i005 >= 0))              +
  geom_vline(xintercept = 0, linetype = 'longdash')           +
  xlab('Democratic Vote Share Margin of Victory, Election t') +
  ylab('Democrat Vote Share, Election t+1')                +
  theme_bw()
plot.a

## ----panel.bsetup, include=FALSE-----------------------------------------
panel.b.cap = "Candidate's probability of winning election $t-1$, by margin of victory in election $t$: local averages and logit polynomial fit"

## ----panel.b, fig.height = 4, fig.width = 10, fig.cap = panel.a.cap, echo=FALSE, warning=FALSE----

# Predict with local polynomial logit of degree 4
logit.b   <- glm(formula = demshareprev ~ poly(difdemshare, degree = 4) +
                 poly(difdemshare, degree = 4) * d,
               family  = binomial(link = "logit"),
               data    = lee2008)
lee2008$demshareprevhat<-predict(logit.b, lee2008, type = "response")

# Create local average by 0.005 interval of the running variable (share)
breaks  <- round(seq(-1, 1, by = 0.005), 3)
lee2008$i005<-as.numeric(as.character(cut(lee2008$difdemshare,
                                          breaks = breaks,
                                          labels = head(breaks, -1),
                                          right  = TRUE)))


m_next<-tapply(lee2008$demshareprev,lee2008$i005,mean)
m_next<-data.frame(i005=rownames(m_next), m_next=m_next)
mp_next<-tapply(lee2008$demshareprevhat,lee2008$i005,mean)
mp_next<-data.frame(i005=rownames(mp_next), mp_next=mp_next)
panel.b<-merge(m_next,mp_next,by=c("i005"), all=T)
panel.b$i005<-as.numeric(as.character(panel.b$i005))


# Plot panel (b)
panel.b <- panel.b[which(panel.b$i005 > -0.251 & panel.b$i005 < 0.251), ]
plot.b  <- ggplot(data = panel.b, aes(x = i005))                       +
  geom_point(aes(y = m_next))                                 +
  geom_line(aes(y = mp_next, group = i005 >= 0))              +
  geom_vline(xintercept = 0, linetype = 'longdash')           +
  xlab('Democratic Vote Share Margin of Victory, Election t') +
  ylab('Democrat Vote Share, Election t-1')                +
  theme_bw()
plot.b

## ----userdefined_single variable-----------------------------------------
# Lee2008
set.seed(101)
permtest<-RDperm(W="demshareprev", z="difdemshare",data=lee2008,q_type=51)
summary(permtest)

## ----rot-----------------------------------------------------------------
permtest_rot<-RDperm(W=c("demshareprev","demwinprev", "demofficeexp"),
                      z="difdemshare",data=lee2008,q_type='rot', n.perm=600)
summary(permtest_rot)

## ----hist.cdf.setup, include=FALSE---------------------------------------
hist.cdf.cap = "Histogram and CDF for Democrat vote share t-1"

## ----hist.cdf, fig.height = 4, fig.width = 10, fig.cap = hist.cdf.cap , echo=TRUE----
plot(permtest,w="demshareprev")

