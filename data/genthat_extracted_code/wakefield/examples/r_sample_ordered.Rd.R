library(wakefield)


### Name: r_sample_ordered
### Title: Generate Random Ordered Factor Vector
### Aliases: r_sample_ordered
### Keywords: factor ordered

### ** Examples

r_sample_ordered(100, name = "Var")

lvls <- c("Strongly Agree", "Agree", "Neutral", "Disagree", "Strongly Disagree")
table(r_sample_ordered(x = lvls, n=1000))

(out <- r_sample_ordered(x = c("Black", "Grey", "White"),
    prob = c(.5, .2, .3), n = 100))
slices <- c(table(out))
pie(slices, main="Pie Chart of Colors", col = tolower(names(slices)))



