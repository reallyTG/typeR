library(pscl)


### Name: unionDensity
### Title: cross national rates of trade union density
### Aliases: unionDensity
### Keywords: datasets

### ** Examples

data(unionDensity)
summary(unionDensity)
pairs(unionDensity,
      labels=c("Union\nDensity",
        "Left\nGovernment",
        "log Size of\nLabor Force",
        "Economic\nConcentration"),
      lower.panel=function(x,y,digits=2){
        r <- cor(x,y)
        par(usr=c(0,1,0,1))
        text(.5,.5,
             format(c(r,0.123456789),digits=digits)[1],
             cex=1.5)
      }
      )
ols <- lm(union ~ left + size + concen,
          data=unionDensity)
summary(ols)



