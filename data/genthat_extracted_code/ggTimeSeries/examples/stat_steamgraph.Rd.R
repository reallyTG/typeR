library(ggTimeSeries)


### Name: stat_steamgraph
### Title: Plot multiple time series as a steamgraph
### Aliases: stat_steamgraph

### ** Examples

{
library(ggplot2)
set.seed(10)
df = data.frame(
Time=1:1000,
Signal=abs(c(cumsum(rnorm(1000, 0, 3)),
    cumsum(rnorm(1000, 0, 4)), cumsum(rnorm(1000, 0, 1)),
     cumsum(rnorm(1000, 0, 2)))),
Variable = c(rep('a', 1000), rep('b', 1000), rep('c',
    1000), rep('d', 1000)),
VariableLabel = c(rep('Class A', 1000), rep('Class B',
    1000), rep('Class C', 1000), rep('Class D', 1000))
)

ggplot(df, aes(x = Time, y = Signal, group = Variable, fill = VariableLabel)) +
  stat_steamgraph()}



