library(DAAG)


### Name: kiwishade
### Title: Kiwi Shading Data
### Aliases: kiwishade
### Keywords: datasets

### ** Examples

print("Data Summary - Example 2.2.1")
attach(kiwishade)
kiwimeans <- aggregate(yield, by=list(block, shade), mean)
names(kiwimeans) <- c("block","shade","meanyield")

kiwimeans[1:4,]
pause()

print("Multilevel Design - Example 9.3")
kiwishade.aov <- aov(yield ~ shade+Error(block/shade),data=kiwishade)
summary(kiwishade.aov)
pause()


sapply(split(yield, shade), mean)

pause()

kiwi.table <- t(sapply(split(yield, plot), as.vector))
kiwi.means <- sapply(split(yield, plot), mean)
kiwi.means.table <- matrix(rep(kiwi.means,4), nrow=12, ncol=4)
kiwi.summary <- data.frame(kiwi.means, kiwi.table-kiwi.means.table)
names(kiwi.summary)<- c("Mean", "Vine 1", "Vine 2", "Vine 3", "Vine 4")
kiwi.summary
mean(kiwi.means) # the grand mean (only for balanced design)

if(require(lme4, quietly=TRUE)) {
kiwishade.lmer <- lmer(yield ~ shade + (1|block) + (1|block:plot),
                       data=kiwishade)
## block:shade is an alternative to block:plot

kiwishade.lmer


##                  Residuals and estimated effects
xyplot(residuals(kiwishade.lmer) ~ fitted(kiwishade.lmer)|block,
                data=kiwishade, groups=shade,
                layout=c(3,1), par.strip.text=list(cex=1.0),
                xlab="Fitted values (Treatment + block + plot effects)",
                ylab="Residuals", pch=1:4, grid=TRUE,
                scales=list(x=list(alternating=FALSE), tck=0.5),
                key=list(space="top", points=list(pch=1:4),
                         text=list(labels=levels(kiwishade$shade)),columns=4))
ploteff <- ranef(kiwishade.lmer, drop=TRUE)[[1]]
qqmath(ploteff, xlab="Normal quantiles", ylab="Plot effect estimates",
       scales=list(tck=0.5))
}



