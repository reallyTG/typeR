library(REdaS)


### Name: Confidence-Intervals-for-Frequencies
### Title: Confidence Intervals for Relative Frequencies
### Aliases: freqCI print.freqCI barplot.freqCI

### ** Examples

# generate some simple data using rep() and inspect them using table()
mydata <- rep(letters[1:3], c(100,200,300))
table(mydata)
100 * prop.table(table(mydata))

# compute 95% and 99% confidence intervals and print them with standard settings
res <- freqCI(mydata, level = c(.95, .99))
res

# print the result as relative frequencies rounded to 3 digits, save the result
# and print the invisibly returned matrix
resmat <- print(res, percent = FALSE, digits = 3)
resmat

# plot the results and save the x-coordinates
x_coo <- barplot(res)
x_coo

# use the x-coordinates to plot the frequencies per category
text(x_coo, 0, labels = paste0("n = ", res$freq), pos = 3)



