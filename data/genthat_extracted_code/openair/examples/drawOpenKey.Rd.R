library(openair)


### Name: drawOpenKey
### Title: Scale key handling for openair
### Aliases: drawOpenKey
### Keywords: methods

### ** Examples



##########
#example 1
##########

#paddle style scale key used by windRose

windRose(mydata,)

#adding text and changing style and position via key

#note:
#some simple key control also possible directly
#For example, below does same as
#windRose(mydata, key.position="right")

windRose(mydata,
   key =list(space="right")
)

#however:
#more detailed control possible working with
#key and drawOpenKey. For example,

windRose(mydata,
   key = list(header="Title", footer="wind speed",
              plot.style = c("ticks", "border"),
              fit = "all", height = 1,
              space = "top")
)





