library(fastR2)


### Name: TasteTest
### Title: Taste test data
### Aliases: TasteTest Taste1
### Keywords: datasets

### ** Examples


data(TasteTest)
data(Taste1)
gf_jitter(score ~ scr, data = TasteTest, color = ~liq, width = 0.2, height =0) %>%
  gf_line(stat = "summary", group = ~liq)
df_stats(score ~ scr | liq, data = TasteTest)




