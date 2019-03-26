## ---- eval=T, echo=FALSE-------------------------------------------------
require(idem);
set.seed(1000);

## ---- eval=T, echo=TRUE--------------------------------------------------
head(abc);

## ---- echo=TRUE, fig.width=6, fig.height=5-------------------------------
rst.data <- imData(abc, trt="TRT", outcome=c("Y1","Y2"), y0=NULL,
                   endfml="Y3", bounds=c(10,20), duration=365,
                   err.terminate = FALSE);
print(rst.data);

rst.data <- imData(abc, trt="TRT", surv="SURV", outcome=c("Y1","Y2"),
                   y0=NULL, endfml="Y2",
                   trt.label = c("UC+SBT", "SAT+SBT"),
                   cov=c("AGE"), duration=365, bounds=c(0,100));

## ---- echo=TRUE, fig.width=6, fig.height=5-------------------------------
plot(rst.data, opt = "survivor");

## ---- echo=TRUE----------------------------------------------------------
summary(rst.data, opt = "misstable");

## ---- echo=TRUE, fig.width=6, fig.height=5-------------------------------
plot(rst.data, opt = "missing", cols = c("blue", "gray"));

## ---- echo=TRUE, fig.width=6, fig.height=5-------------------------------
plot(rst.data, opt = "KM");

## ---- echo=TRUE, fig.width=6, fig.height=5-------------------------------
rst.fit <- imFitModel(rst.data);

## ---- echo=TRUE, fig.width=6, fig.height=5-------------------------------
plot(rst.fit, mfrow=c(2,4));

## ---- echo=TRUE, fig.width=6, fig.height=5-------------------------------
rst.mixing <- imImpSingle(abc[1,], rst.fit, chains = 4, iter = 2000, warmup = 1000);
plot(rst.mixing);

## ---- echo=TRUE, results="hide"------------------------------------------
rst.imp <- imImpAll(rst.fit, deltas=c(-0.25,0,0.25),
                    normal=TRUE, chains = 4, iter = 300, warmup = 100);

rst.imp

## ---- echo=TRUE, fig.width=6, fig.height=5-------------------------------
plot(rst.imp, opt = "imputed", deltas = c(-0.25,0,0.25), xlim=c(0,100), endp=FALSE);

## ---- echo=TRUE, fig.width=6, fig.height=5-------------------------------
plot(rst.imp, opt = "imputed", deltas = c(-0.25,0,0.25), xlim=c(0,100), endp=TRUE);

## ---- echo=TRUE, fig.width=6, fig.height=5-------------------------------
plot(rst.imp, delta=0);

## ---- echo=TRUE----------------------------------------------------------
rst.test <- imInfer(rst.imp, n.boot = 2);
rst.test

## ---- echo=TRUE, fig.width=6, fig.height=5-------------------------------
plot(rst.test, nlevels = 30, con.v=0.05, zlim=c(0, 0.05));

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  imShiny();

