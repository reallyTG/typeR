library(alakazam)


### Name: plotDiversityTest
### Title: Plot the results of TestDiversity
### Aliases: plotDiversityTest

### ** Examples

# All groups pass default minimum sampling threshold of 10 sequences
div <- testDiversity(ExampleDb, "SAMPLE", q=0, nboot=100)
plotDiversityTest(div, legend_title="Sample")




