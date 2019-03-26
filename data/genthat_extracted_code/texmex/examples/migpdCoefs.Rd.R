library(texmex)


### Name: migpdCoefs
### Title: Change values of parameters in a migpd object
### Aliases: migpdCoefs
### Keywords: multivariate

### ** Examples


library(MASS)
liver <- liver
liver$ndose <- as.numeric(liver$dose)
d <- data.frame(alt = resid(rlm(log(ALT.M) ~ log(ALT.B) + ndose, data=liver)),
                ast = resid(rlm(log(AST.M) ~ log(AST.B) + ndose, data=liver)),
                alp = resid(rlm(log(ALP.M) ~ log(ALP.B) + ndose, data=liver)),
                tbl = resid(rlm(log(TBL.M) ~ log(TBL.B) + ndose, data=liver)))

Dgpds <- migpd(d[liver$dose == "D", 1:4], mqu=.7)

d$ndose <- liver$ndose
galt <- evm(alt, data=d, qu=.7, xi = ~ ndose)
gast <- evm(ast, data=d, qu=.7, xi = ~ ndose)
galp <- evm(alp, data=d, qu=.7, xi = ~ ndose)

altco <- predict(galt,type="lp",newdata=data.frame(ndose=4))$obj$link[1:2]
astco <- predict(gast,type="lp",newdata=data.frame(ndose=4))$obj$link[1:2]
alpco <- predict(galp,type="lp",newdata=data.frame(ndose=4))$obj$link[1:2]

Dgpd <- migpdCoefs(Dgpds, which=c("alt", "ast", "alp"),
                   coefs=list(altco, astco, alpco))

summary(Dgpd)
summary(Dgpds)





