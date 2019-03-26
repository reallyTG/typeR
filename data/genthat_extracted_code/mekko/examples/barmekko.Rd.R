library(mekko)


### Name: barmekko
### Title: Create a bar mekko plot.
### Aliases: barmekko

### ** Examples

library(ggplot2)
df <- data.frame(
  region = c('Northeast', 'Southeast', 'Central', 'West'),
  sales = c(1200, 800, 450, 900),
  avg_margin = c(3.2, -1.4, 0.1, 2.1)
  )
barmekko(df, region, avg_margin, sales)
barmekko(df, region, avg_margin, sales) + labs(title = 'Margins by Region')
barmekko(df[order(-df$sales),], region, avg_margin, sales)
barmekko(df[order(-df$avg_margin),], region, avg_margin, sales)



