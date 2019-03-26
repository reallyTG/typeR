library(heplots)


### Name: Oslo
### Title: Oslo Transect Subset Data
### Aliases: Oslo
### Keywords: datasets

### ** Examples

data(Oslo)
table(Oslo$litho)

Oslo.mod <- lm(cbind(Cu, K, Mg, Mn, P, Zn) ~ litho, data=Oslo)
Anova(Oslo.mod)

heplot(Oslo.mod, var=c("Cu", "Mn"))
pairs(Oslo.mod)

## Not run: 
##D if(require(candisc)) {
##D   Oslo.can <- candisc(Oslo.mod)
##D   Oslo.can
##D   heplot(Oslo.can)
##D   heplot3d(Oslo.can, shade=TRUE, wire=FALSE, alpha=0.5, var.col="red")
##D }
## End(Not run)




