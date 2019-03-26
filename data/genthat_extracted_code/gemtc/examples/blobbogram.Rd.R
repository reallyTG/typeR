library(gemtc)


### Name: blobbogram
### Title: Plot a blobbogram (AKA forest plot)
### Aliases: blobbogram forest

### ** Examples

data <- read.table(textConnection('
id               group pe       ci.l ci.u style      value.A    value.B 
"Study 1"  1         0.35 0.08 0.92 "normal" "2/46"     "7/46" 
"Study 2"  1         0.43 0.15 1.14 "normal" "4/50"     "8/49" 
"Study 3"  2         0.31 0.07 0.74 "normal" "2/97"     "10/100"
"Study 4"  2         0.86 0.34 2.90 "normal" "9/104"    "6/105" 
"Study 5"  2         0.33 0.10 0.72 "normal" "4/74"     "14/74" 
"Study 6"  2         0.47 0.23 0.91 "normal" "11/120" "22/129"
"Pooled"     NA      0.42 0.15 1.04 "pooled" NA             NA 
'), header=TRUE)
data$pe <- log(data$pe)
data$ci.l <- log(data$ci.l)
data$ci.u <- log(data$ci.u)

blobbogram(data, group.labels=c('GROUP 1', 'GROUP 2'),
    columns=c('value.A', 'value.B'), column.labels=c('r/n', 'r/n'),
    column.groups=c(1, 2), grouped=TRUE,
    column.group.labels=c('Intervention', 'Control'),
    id.label="Trial", ci.label="Odds Ratio (95% CrI)", log.scale=TRUE)



