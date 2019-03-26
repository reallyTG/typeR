library(icesTAF)


### Name: rnd
### Title: Round Columns
### Aliases: rnd

### ** Examples

# With rnd() we no longer need to repeat the column names:

m <- mtcars
m[c("mpg","disp","qsec")] <- round(m[c("mpg","disp","qsec")])
m <- rnd(m, c("mpg","disp","qsec"))

# The x1/x2/x3/x4 approaches are equivalent:

x1 <- rnd(summary.taf, c("Rec","Rec_lo","Rec_hi",
                         "TSB","TSB_lo","TSB_hi",
                         "SSB","SSB_lo","SSB_hi",
                         "Removals","Removals_lo","Removals_hi"))
x1 <- rnd(x1, c("Fbar","Fbar_lo","Fbar_hi"), 3)

x2 <- rnd(summary.taf, "Rec|TSB|SSB|Removals", grep=TRUE)
x2 <- rnd(x2, "Fbar", 3, grep=TRUE)

x3 <- rnd(summary.taf, "Fbar", grep=TRUE, invert=TRUE)
x3 <- rnd(x3, "Fbar", 3, grep=TRUE)

# Less reliable in scripts if columns have been added/deleted/reordered:

x4 <- rnd(summary.taf, 2:13)
x4 <- rnd(x4, 14:16, 3)




