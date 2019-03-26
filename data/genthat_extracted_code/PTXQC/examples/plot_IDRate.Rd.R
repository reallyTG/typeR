library(PTXQC)


### Name: plot_IDRate
### Title: Plot percent of identified MS/MS for each Raw file.
### Aliases: plot_IDRate

### ** Examples

 id_rate_bad = 20; id_rate_great = 35;
 label_ID = c("bad (<20%)" = "red", "ok (...)" = "blue", "great (>35%)" = "green")
 data = data.frame(fc.raw.file = paste('file', letters[1:3]),
                   ms.ms.identified.... = rnorm(3, 25, 15))
 data$cat = factor(cut(data$ms.ms.identified....,
                       breaks=c(-1, id_rate_bad, id_rate_great, 100),
                       labels=names(label_ID)))                  
 plot_IDRate(data, id_rate_bad, id_rate_great, label_ID)




