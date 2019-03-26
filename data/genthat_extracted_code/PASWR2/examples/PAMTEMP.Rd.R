library(PASWR2)


### Name: PAMTEMP
### Title: Pamplona Temperatures
### Aliases: PAMTEMP
### Keywords: datasets

### ** Examples

str(PAMTEMP)
levels(PAMTEMP$month)
PAMTEMP$month <- factor(PAMTEMP$month, levels = month.abb[1:12])
levels(PAMTEMP$month)
ggplot(data = PAMTEMP, aes(x = 1:dim(PAMTEMP)[1], y = tmean)) + 
geom_line() + 
theme_bw() + 
labs(x = "", y = "Average Temperature (Celcius)")



