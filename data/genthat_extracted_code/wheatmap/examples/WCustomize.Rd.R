library(wheatmap)


### Name: WCustomize
### Title: Customize an existing plot
### Aliases: WCustomize

### ** Examples

WHeatmap(matrix(c('fred','frank','brad',
                'frank','fred','frank'), ncol=2)) +
  WLegendV(NULL, RightOf(), label.fontsize = 20) +
  WCustomize(mar.right=0.1)



