library(HRW)


### Name: indonRespir
### Title: Respiratory infection in Indonesian children
### Aliases: indonRespir

### ** Examples

library(HRW) ; data(indonRespir)
if (require("mgcv"))
{
   fit <- gamm(respirInfec ~ s(age) + vitAdefic + female + height
            + stunted + visit2 + visit3 + visit4  + visit5 + visit6,
            random = list(idnum = ~1),family = binomial,data = indonRespir)
   summary(fit$gam)
}



