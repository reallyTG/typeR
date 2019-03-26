library(AMR)


### Name: as.rsi
### Title: Class 'rsi'
### Aliases: as.rsi is.rsi is.rsi.eligible
### Keywords: rsi

### ** Examples

rsi_data <- as.rsi(c(rep("S", 474), rep("I", 36), rep("R", 370)))
rsi_data <- as.rsi(c(rep("S", 474), rep("I", 36), rep("R", 370), "A", "B", "C"))
is.rsi(rsi_data)

# this can also coerce combined MIC/RSI values:
as.rsi("<= 0.002; S") # will return S

plot(rsi_data)    # for percentages
barplot(rsi_data) # for frequencies
freq(rsi_data)    # frequency table with informative header

# fastest way to transform all columns with already valid AB results to class `rsi`:
library(dplyr)
septic_patients %>%
  mutate_if(is.rsi.eligible,
            as.rsi)



