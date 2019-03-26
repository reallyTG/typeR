library(R2HTML)


### Name: HTML
### Title: Outputs an object to a HTML file
### Aliases: HTML HTML.anova HTML.aov HTML.aovlist HTML.array HTML.atomic
###   HTML.by HTML.call HTML.character HTML.coefmat HTML.complex
###   HTML.connection HTML.default HTML.density HTML.difftime
###   HTML.dummy.coef HTML.dummy.coef.list HTML.environment HTML.factor
###   HTML.family HTML.formula HTML.ftable HTML.glm HTML.glm.null
###   HTML.hsearch HTML.htest HTML.infl HTML.integer HTML.integrate
###   HTML.list HTML.listof HTML.lm HTML.lm.null HTML.logical HTML.logLik
###   HTML.MethodsFunction HTML.mtable HTML.noquote HTML.numeric
###   HTML.octmode HTML.ordered HTML.pairlist HTML.POSIXct HTML.POSIXlt
###   HTML.rle HTML.SavedPlots HTML.simple.list HTML.socket
###   HTML.summary.aov HTML.summary.aovlist HTML.summary.glm
###   HTML.summary.glm.null HTML.summary.lm HTML.summary.lm.null
###   HTML.summary.manova HTML.summary.table HTML.table HTML.tables.aov
###   HTML.terms HTML.ts HTML.TukeyHSD HTML.xtable HTML.xtabs HTML.abbrev
###   HTML.agnes HTML.Anova HTML.anova.loglm HTML.ar HTML.Arima HTML.arima0
###   HTML.boot HTML.bootci HTML.bSpline HTML.clara HTML.correspondence
###   HTML.cox.zph HTML.coxph.null HTML.diana HTML.dissimilarity HTML.dist
###   HTML.ecdf HTML.ellipsoid HTML.factanal HTML.fanny HTML.fitdistr
###   HTML.fractions HTML.gam HTML.gamma.shape HTML.glm.dose HTML.grob
###   HTML.hclust HTML.HoltWinters HTML.lda HTML.libraryIQR HTML.loadings
###   HTML.loess HTML.loglm HTML.lqs HTML.mca HTML.medpolish HTML.mona
###   HTML.multinom HTML.nls HTML.nnet HTML.pairwise.htest HTML.pam
###   HTML.polr HTML.polySpline HTML.power.htest HTML.ppolySpline HTML.ppr
###   HTML.prcomp HTML.princomp HTML.qda HTML.ridgelm HTML.rlm
###   HTML.rms.curv HTML.rpart HTML.saddle.distn HTML.shingle
###   HTML.shingleLevel HTML.simplex HTML.smooth.spline HTML.stepfun
###   HTML.stl HTML.StructTS HTML.structure HTML.summary.agnes
###   HTML.summary.clara HTML.summary.diana HTML.summary.fanny
###   HTML.summary.gam HTML.summary.loess HTML.summary.loglm
###   HTML.summary.mona HTML.summary.multinom HTML.summary.negbin
###   HTML.summary.nls HTML.summary.nnet HTML.summary.pam HTML.summary.polr
###   HTML.summary.ppr HTML.summary.prcomp HTML.summary.princomp
###   HTML.summary.rlm HTML.tskernel HTML.tukeyline HTML.tukeysmooth
###   HTML.unit HTML.viewport HTML.reStruct HTML.summary.lme
###   HTML.summary.pdDiag
### Keywords: print IO file

### ** Examples

dir.create(file.path(tempdir(),"R2HTML"))
target <- HTMLInitFile(file.path(tempdir(),"R2HTML"),filename="sample", BackGroundColor="#BBBBEE")
HTML("<br>Don't forget to use the CSS file in order to benefit from fixed-width font",file=target)
tmp <- as.data.frame(matrix(rnorm(100),ncol=10))
HTML(tmp,file=target)
HTMLEndFile()



