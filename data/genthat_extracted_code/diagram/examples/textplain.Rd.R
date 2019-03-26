library(diagram)


### Name: textplain
### Title: adds lines of text to a plot
### Aliases: textplain
### Keywords: aplot

### ** Examples

  openplotmat(main = "textplain")
  textplain(mid = c(0.5, 0.5), 
            lab = c("this text is", "centered", "4 strings", "on 4 lines"))
  textplain(mid = c(0.5, 0.2), adj = c(0, 0.5), font = 2, height = 0.05,
            lab = c("this text is","left alligned"))
  textplain(mid = c(0.5, 0.8), adj = c(1, 0.5), font = 3, height = 0.05, 
            lab = c("this text is","right alligned"))



