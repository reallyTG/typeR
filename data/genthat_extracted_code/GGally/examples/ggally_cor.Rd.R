library(GGally)


### Name: ggally_cor
### Title: Correlation from the Scatter Plot
### Aliases: ggally_cor
### Keywords: hplot

### ** Examples

 data(tips, package = "reshape")
 ggally_cor(tips, mapping = ggplot2::aes_string(x = "total_bill", y = "tip"))
 ggally_cor(
   tips,
   mapping = ggplot2::aes(x = total_bill, y = tip),
   size = 15,
   colour = I("red")
 )
 ggally_cor(
   tips,
   mapping = ggplot2::aes_string(x = "total_bill", y = "tip", color = "sex"),
   size = 5
 )



