library(InterVA4)


### Name: InterVA.plot
### Title: Plot a individual level distribution of va probabilities.
### Aliases: InterVA.plot
### Keywords: InterVA

### ** Examples

data(SampleInput)
sample.output <- InterVA(SampleInput, HIV = "h", Malaria = "v", directory = "VA test",
    filename = "VA_result", output = "extended", append = FALSE)

## Individual level summary using pie chart
InterVA.plot(sample.output$VA[[7]], type = "pie", min.prob = 0.01,
    main = "1st sample VA analysis using pie chart", clockwise = FALSE,
    radius = 0.6, cex = 0.6, cex.main = 0.8)


## Individual level summary using bar chart
InterVA.plot(sample.output$VA[[7]], type = "bar", min.prob = 0.01,
    main = "2nd sample VA analysis using bar chart", cex.main = 0.8)



