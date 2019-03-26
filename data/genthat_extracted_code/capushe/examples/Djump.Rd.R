library(capushe)


### Name: Djump
### Title: Model selection by dimension jump
### Aliases: Djump Djump-class plot,Djump-method print,Djump-method
###   show,Djump-method summary,Djump-method print.Djump show.Djump
###   summary.Djump djump DJUMP Dimensionjump DimensionJump Dimension_Jump
###   Dimension_jump
### Keywords: models

### ** Examples

data(datacapushe)
Djump(datacapushe)
plot(Djump(datacapushe))
Djump(datacapushe,Careajump=sqrt(log(1000)/1000))
plot(Djump(datacapushe,Careajump=sqrt(log(1000)/1000)))
Djump(datacapushe,Ctresh=1000/log(1000))
plot(Djump(datacapushe,Ctresh=1000/log(1000)))



