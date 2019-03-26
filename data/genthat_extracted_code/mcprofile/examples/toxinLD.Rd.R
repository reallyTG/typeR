library(mcprofile)


### Name: toxinLD
### Title: Identifying the lethal dose of a crop protection product.
### Aliases: toxinLD
### Keywords: datasets

### ** Examples

str(toxinLD)

###############################################
# logistic regression on the logarithmic dose #
###############################################

toxinLD$logdose <- log(toxinLD$dose)
fm <- glm(cbind(dead, alive) ~ logdose, data=toxinLD, family=binomial(link="logit"))

#############
# profiling #
#############

# contrast matrix
pdose <- seq(-1,2.3, length=7)
CM <- model.matrix(~ pdose)

# user defined grid to construct profiles
mcpgrid <- matrix(seq(-11,8,length=15), nrow=15, ncol=nrow(CM))
mc <- mcprofile(fm, CM, grid=mcpgrid)

####################################
## confidence interval calculation #
####################################

# srdp profile
ci <- confint(mc)
ppdat <- data.frame(logdose=pdose)
ppdat$estimate <- fm$family$linkinv(ci$estimate$Estimate)
ppdat$lower <- fm$family$linkinv(ci$confint$lower)
ppdat$upper <- fm$family$linkinv(ci$confint$upper)
ppdat$method <- "profile"

# wald profile
wci <- confint(wald(mc))
wpdat <- ppdat
wpdat$estimate <- fm$family$linkinv(wci$estimate$Estimate)
wpdat$lower <- fm$family$linkinv(wci$confint$lower)
wpdat$upper <- fm$family$linkinv(wci$confint$upper)
wpdat$method <- "wald"

# higher order approximation
hci <- confint(hoa(mc))
hpdat <- ppdat
hpdat$estimate <- fm$family$linkinv(hci$estimate$Estimate)
hpdat$lower <- fm$family$linkinv(hci$confint$lower)
hpdat$upper <- fm$family$linkinv(hci$confint$upper)
hpdat$method <- "hoa"

# combine results
pdat <- rbind(ppdat, wpdat, hpdat)


#####################################
# estimating the lethal dose LD(25) #
#####################################

ld <- 0.25
pspf <- splinefun(ppdat$upper, pdose)
pll <- pspf(ld)
wspf <- splinefun(wpdat$upper, pdose)
wll <- wspf(ld)
hspf <- splinefun(hpdat$upper, pdose)
hll <- hspf(ld)

ldest <- data.frame(limit=c(pll, wll, hll), method=c("profile","wald", "hoa"))

################################
# plot of intervals and LD(25) #
################################

ggplot(toxinLD, aes(x=logdose, y=dead/(dead+alive))) + 
  geom_ribbon(data=pdat, aes(y=estimate, ymin=lower, ymax=upper, 
              fill=method, colour=method, linetype=method), 
              alpha=0.1, size=0.95) +
  geom_line(data=pdat, aes(y=estimate, linetype=method), size=0.95) +
  geom_point(size=3) +
  geom_hline(yintercept=ld, linetype=2) +
  geom_segment(data=ldest, aes(x=limit, xend=limit, y=0.25, yend=-0.05, 
               linetype=method), size=0.6, colour="grey2") +
  ylab("Mortality rate")



