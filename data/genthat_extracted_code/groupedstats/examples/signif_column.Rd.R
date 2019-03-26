library(groupedstats)


### Name: signif_column
### Title: Creating a new character type column with significance labels
### Aliases: signif_column

### ** Examples


# vector as input
groupedstats::signif_column(p = c(0.05, 0.1, 1, 0.00001, 0.001, 0.01))

# dataframe as input
# preparing a newdataframe
df <- cbind.data.frame(
  x = 1:5,
  y = 1,
  p.value = c(0.1, 0.5, 0.00001, 0.05, 0.01)
)

groupedstats::signif_column(data = df, p = p.value)

# numbers entered as characters are also tolerated
groupedstats::signif_column(p = c("1", "0.1", "0.0002", "0.03", "0.65"))



