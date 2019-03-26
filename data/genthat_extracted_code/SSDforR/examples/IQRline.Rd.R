library(SSDforR)


### Name: IQRline
### Title: IQR line for ABplot
### Aliases: IQRline
### Keywords: ~kwd1 ~kwd2

### ** Examples

cry<-c(3, 4, 2, 5, 3, 4, NA, 2, 2, 3, 2, 1, 2, NA, 2, 2, 1, 2, 1, 0, 0, 0)
pcry<-c("A", "A", "A", "A", "A", "A", NA, "B", "B", "B", "B", "B", "B",
NA, "B1", "B1", "B1", "B1", "B1", "B1", "B1", "B1")
ABplot(cry,pcry,"week","amount","Crying")
# type IQRline(cry, pcry, "A")



