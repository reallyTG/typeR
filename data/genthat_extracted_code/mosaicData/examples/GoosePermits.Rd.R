library(mosaicData)


### Name: GoosePermits
### Title: Goose Permit Study
### Aliases: GoosePermits

### ** Examples

data(GoosePermits)

goose.model <- 
  glm( cbind(keep, sell) ~ log(bid), data = GoosePermits, family = binomial())
if (require(ggformula)) {
  y.hat <- makeFun(goose.model)
  gf_point( (keep/(keep+sell)) ~ bid, data = GoosePermits, ylim = c(0,1.05)) %>%
  gf_fun(y.hat(b) ~ b, add = TRUE, color = "red", alpha = 0.5) 
}




