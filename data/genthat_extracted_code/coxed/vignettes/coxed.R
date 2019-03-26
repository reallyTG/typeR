## ----libraries, message=FALSE, warning=FALSE-----------------------------
library(coxed)

## ----libraries2, message=FALSE, warning=FALSE----------------------------
library(dplyr)
library(tidyr)
library(ggplot2)

## ----coxmodel------------------------------------------------------------
mv.surv <- Surv(martinvanberg$formdur, event = rep(1, nrow(martinvanberg)))
mv.cox <- coxph(mv.surv ~ postel + prevdef + cont + ident + rgovm + pgovno + 
                     tpgovno + minority, method = "breslow", data = martinvanberg)
summary(mv.cox)

## ----npsf1---------------------------------------------------------------
ed1 <- coxed(mv.cox, method="npsf")

## ----npsfexpdur----------------------------------------------------------
head(ed1$exp.dur)

## ----sumamrynpsf---------------------------------------------------------
summary(ed1, stat="mean")
summary(ed1, stat="median")

## ----baselinefun---------------------------------------------------------
head(ed1$baseline.functions)

## ----baselineplot, fig.width=6, fig.height=4-----------------------------
baseline <- gather(ed1$baseline.functions, cbh, survivor, key="survivefunction", value="value")
ggplot(baseline, aes(x=time, y=value)) +
     geom_line() +
     xlab("Time") +
     ylab("Function") +
     facet_wrap( ~ survivefunction, scales = "free")

## ----npsfbs--------------------------------------------------------------
ed1 <- coxed(mv.cox, method="npsf", bootstrap = TRUE, B=30)

## ----bsexpdurnpsf--------------------------------------------------------
head(ed1$exp.dur)

## ----npsfsummarybs-------------------------------------------------------
summary(ed1, stat="mean")
summary(ed1, stat="median")

## ----npsfbs3-------------------------------------------------------------
ed1 <- coxed(mv.cox, method="npsf", bootstrap = TRUE, B=30, level=.8)
summary(ed1, stat="mean")
summary(ed1, stat="median")

## ----npsfbs4-------------------------------------------------------------
ed1 <- coxed(mv.cox, method="npsf", bootstrap = TRUE, B=30, confidence="empirical")
summary(ed1, stat="mean")
summary(ed1, stat="median")

## ----newdataframe--------------------------------------------------------
new.coalitions <- data.frame(postel = c(1,1,1,0,1),
                             prevdef = c(0,0,1,1,0),
                             cont = c(1,0,1,0,1),
                             ident = c(1,2,2,3,3),
                             rgovm = c(.3,.8, 1.1,.2,.35),
                             pgovno = c(2,3,3,2,4),
                             tpgovno = c(3.2,0,5,0,2.6),
                             minority = c(0,0,1,0,0))
new.coalitions

## ----coxedoutofsample----------------------------------------------------
forecast <- coxed(mv.cox, newdata=new.coalitions, method="npsf", bootstrap=TRUE, B=30)
forecast$exp.dur

## ----npsfme--------------------------------------------------------------
me <- coxed(mv.cox, method="npsf", bootstrap = TRUE, B=30,
            newdata = mutate(martinvanberg, rgovm=0),
            newdata2 = mutate(martinvanberg, rgovm=1.24))

## ----npsfmesummary-------------------------------------------------------
summary(me, stat="mean")
summary(me, stat="median")

## ----menpsf2-------------------------------------------------------------
me <- coxed(mv.cox, method="npsf", bootstrap = TRUE, B=30,
            newdata = dplyr::mutate(martinvanberg, pgovno=1),
            newdata2 = dplyr::mutate(martinvanberg, pgovno=6))
summary(me, stat="mean")
summary(me, stat="median")

## ----gam-----------------------------------------------------------------
ed2 <- coxed(mv.cox, method="gam")
head(ed2$exp.dur)

## ----gamsummary----------------------------------------------------------
summary(ed2, stat="mean")
summary(ed2, stat="median")

## ----coxedoutofsample2---------------------------------------------------
forecast <- coxed(mv.cox, newdata=new.coalitions, method="gam")
forecast$exp.dur

## ----gammebs-------------------------------------------------------------
me <- coxed(mv.cox, method="gam",
            newdata = dplyr::mutate(martinvanberg, rgovm=0),
            newdata2 = dplyr::mutate(martinvanberg, rgovm=1.24))
summary(me, stat="mean")
summary(me, stat="median")

## ----gammebs2------------------------------------------------------------
me <- coxed(mv.cox, method="gam", 
            newdata = dplyr::mutate(martinvanberg, pgovno=1),
            newdata2 = dplyr::mutate(martinvanberg, pgovno=6))
summary(me, stat="mean")
summary(me, stat="median")

## ----gammodel------------------------------------------------------------
summary(ed2$gam.data)
summary(ed2$gam.model)

## ----gamfit, fig.width=6, fig.height=6, fig.align="center"---------------
ggplot(ed2$gam.data, aes(x=rank.xb, y=y)) +
     geom_point() +
     geom_line(aes(x=rank.xb, y=gam_fit)) +
     geom_ribbon(aes(ymin=gam_fit_95lb, ymax=gam_fit_95ub), alpha=.5) +
     xlab("Cox model LP rank (smallest to largest)") +
     ylab("Duration")

## ----tester--------------------------------------------------------------
tester <- data.frame(y=martinvanberg$formdur, npsf=ed1$exp.dur$exp.dur, gam=ed2$exp.dur$exp.dur)
cor(tester)

## ----tester2, fig.width=6, fig.height=6, fig.align="center"--------------
pairs(tester)

## ----tvc-----------------------------------------------------------------
bs.surv <- Surv(time = boxsteffensmeier$start, time2 = boxsteffensmeier$te, event = boxsteffensmeier$cut_hi)
bs.cox <- coxph(bs.surv ~ ec + dem + south + iv, data = boxsteffensmeier, method = "breslow")
summary(bs.cox)

## ----tvced---------------------------------------------------------------
ed1 <- coxed(bs.cox, method="npsf", id=boxsteffensmeier$caseid)
summary(ed1, stat="mean")

## ----tvcme---------------------------------------------------------------
me <- coxed(bs.cox, method="npsf",
            newdata = mutate(boxsteffensmeier, ec=quantile(ec, .25)),
            newdata2 = mutate(boxsteffensmeier, ec=quantile(ec, .75)),
            id=boxsteffensmeier$caseid)
summary(me, stat="mean")
summary(me, stat="median")


