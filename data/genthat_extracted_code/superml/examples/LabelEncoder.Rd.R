library(superml)


### Name: LabelEncoder
### Title: Label Encoder
### Aliases: LabelEncoder
### Keywords: datasets

### ** Examples

data_ex <- data.frame(Score = c(10,20,30,4), Name=c('Ao','Bo','Bo','Co'))
lbl <- LabelEncoder$new()
data_ex$Name <- lbl$fit_transform(data_ex$Name)
decode_names <- lbl$inverse_transform(data_ex$Name)



