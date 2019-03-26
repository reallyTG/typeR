library(InterVA4)


### Name: CSMF
### Title: Summarize and plot a population level distribution of va
###   probabilities.
### Aliases: CSMF
### Keywords: interVA

### ** Examples

data(SampleInput)
sample.output <- InterVA(SampleInput, HIV = "h", Malaria = "v", directory = "VA test",
                         filename = "VA_result", output = "extended", append = FALSE)

## Get CSMF without plots
population.summary <- CSMF(sample.output$VA, noplot = TRUE)


## Get CSMF by considering only top 3 causes for each death.
population.summary <- CSMF(sample.output$VA, top.aggregate = 3, noplot = TRUE)

## Get CSMF by considering only top 3 causes reported by InterVA.
## This is equivalent to using CSMF.interVA4() command Note that
## it's different from using all top 3 causses, since they may not
## all be reported
CSMF.summary <- CSMF(sample.output, InterVA.rule = TRUE,
   noplot = TRUE)

## Population level summary using pie chart
CSMF.summary2 <- CSMF(sample.output, type = "pie",
 min.prob = 0.01, main = "population COD distribution using pie chart",
 clockwise = FALSE, radius = 0.7, cex = 0.7, cex.main = 0.8)

## Population level summary using bar chart
CSMF.summary3 <- CSMF(sample.output, type = "bar",
  min.prob = 0.01, main = "population COD distribution using bar chart",
  cex.main = 1)
CSMF.summary4 <- CSMF(sample.output, type = "bar",
  top.plot = 5, main = "Top 5 population COD distribution",
  cex.main = 1)



