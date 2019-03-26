library(cdata)


### Name: map_fields
### Title: Map field values from one column into new derived columns (takes
###   a 'data.frame').
### Aliases: map_fields

### ** Examples


d <- data.frame(what = c("acc", "loss",
                         "val_acc", "val_loss"),
                score = c(0.8, 1.2,
                       0.7, 1.7),
                stringsAsFactors = FALSE)
m <- data.frame(what = c("acc", "loss",
                         "val_acc", "val_loss"),
                measure = c("accuracy", "log-loss",
                            "accuracy", "log-loss"),
                dataset = c("train", "train", "validation", "validation"),
                stringsAsFactors = FALSE)
map_fields(d, 'what', m)




