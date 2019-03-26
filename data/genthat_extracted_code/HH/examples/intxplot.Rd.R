library(HH)


### Name: intxplot
### Title: Interaction plot, with an option to print standard error bars.
### Aliases: intxplot panel.intxplot
### Keywords: dplot

### ** Examples

## This uses the same data as the HH Section 12.13 rhizobium example.

data(rhiz.clover)

## interaction plot, no se
intxplot(Npg ~ strain, groups=comb, data=rhiz.clover)

## interaction plot, individual se for each treatment combination
intxplot(Npg ~ strain, groups=comb, data=rhiz.clover, se=TRUE)

## Rescaled to allow the CI bars to stay within the plot region
intxplot(Npg ~ strain, groups=comb, data=rhiz.clover, se=TRUE,
         ylim=range(rhiz.clover$Npg))

## interaction plot, common se based on ANOVA table
intxplot(Npg ~ strain, groups=comb, data=rhiz.clover,
         se=sqrt(sum((nobs-1)*sd^2)/(sum(nobs-1)))/sqrt(5))

## Rescaled to allow the CI bars to stay within the plot region
intxplot(Npg ~ strain, groups=comb, data=rhiz.clover,
         se=sqrt(sum((nobs-1)*sd^2)/(sum(nobs-1)))/sqrt(5),
         ylim=range(rhiz.clover$Npg))

## change distance between endpoints
intxplot(Npg ~ strain, groups=comb, data=rhiz.clover,
         se=TRUE, offset.scale=20)

## When data includes the nobs and sd variables, data.is.summary=TRUE is needed.
intxplot(Npg ~ strain, groups=comb,
         se=sqrt(sum((nobs-1)*sd^2)/(sum(nobs-1)))/sqrt(5),
         data=sufficient(rhiz.clover, y="Npg", c("strain","comb")),
         data.is.summary=TRUE,
         ylim=range(rhiz.clover$Npg))



