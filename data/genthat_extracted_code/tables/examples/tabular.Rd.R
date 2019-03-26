library(tables)


### Name: tabular
### Title: Compute complex table
### Aliases: tabular tabular.default tabular.formula print.tabular
###   format.tabular [.tabular cbind.tabular rbind.tabular

### ** Examples

tabular( (Species + 1) ~ (n=1) + Format(digits=2)*
         (Sepal.Length + Sepal.Width)*(mean + sd), data=iris )

# This example shows some of the less common options         
Sex <- factor(sample(c("Male", "Female"), 100, rep=TRUE))
Status <- factor(sample(c("low", "medium", "high"), 100, rep=TRUE))
z <- rnorm(100)+5
fmt <- function(x) {
  s <- format(x, digits=2)
  even <- ((1:length(s)) %% 2) == 0
  s[even] <- sprintf("(%s)", s[even])
  s
}
tab <- tabular( Justify(c)*Heading()*z*Sex*Heading(Statistic)*Format(fmt())*(mean+sd) 
                ~ Status )
tab
tab[1:2, c(2,3,1)]



