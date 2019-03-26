library(deaR)


### Name: model_additive
### Title: Additive DEA model.
### Aliases: model_additive

### ** Examples

# Example 1. 
# Replication of results in Charnes et. al (1994, p. 27)
x <- c(2, 3, 6, 9, 5, 4, 10) 
y <- c(2, 5, 7, 8, 3, 1, 7)
data_example <- data.frame(dmus = letters[1:7], x, y)
data_example <- read_data(data_example, 
                          ni = 1, 
                          no = 1)
result <- model_additive(data_example, 
                         rts = "vrs")
efficiencies(result)
slacks(result)
lambdas(result)

# Example 2.
# Measure of Inefficiency Proportions (MIP).
x <- c(2, 3, 6, 9, 5, 4, 10) 
y <- c(2, 5, 7, 8, 3, 1, 7)
data_example <- data.frame(dmus = letters[1:7], x, y)
data_example <- read_data(data_example, ni = 1, no = 1)
result2 <- model_additive(data_example, rts = "vrs",
                          weight_slack_i = 1 / data_example[["input"]],
                          weight_slack_o = 1 / data_example[["output"]])
slacks(result2)

# Example 3.
# Range Adjusted Measure of Inefficiencies (RAM).
x <- c(2, 3, 6, 9, 5, 4, 10) 
y <- c(2, 5, 7, 8, 3, 1, 7)
data_example <- data.frame(dmus=letters[1:7], x, y)
data_example <- read_data(data_example, ni = 1, no = 1)
range_i <- apply(data_example[["input"]], 1, max) - apply(data_example[["input"]], 1, min)
range_o <- apply(data_example[["output"]], 1, max) - apply(data_example[["output"]], 1, min)
w_range_i <- 1 / (range_i * (dim(data_example[["input"]])[1] + dim(data_example[["output"]])[1]))
w_range_o <- 1 / (range_o * (dim(data_example[["output"]])[1] + dim(data_example[["output"]])[1]))
result3 <- model_additive(data_example, rts = "vrs",
                          weight_slack_i = w_range_i,
                          weight_slack_o = w_range_o)
slacks(result3)




