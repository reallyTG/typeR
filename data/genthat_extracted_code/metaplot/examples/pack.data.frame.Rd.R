library(metaplot)


### Name: pack.data.frame
### Title: Capture Scalar Column Metadata as Column Attributes
### Aliases: pack.data.frame

### ** Examples

foo <- data.frame(head(Theoph))
attr(foo$Subject, 'label') <-  'subject identifier'
attr(foo$Wt, 'label') <-  'weight'
attr(foo$Dose, 'label') <-  'dose'
attr(foo$Time, 'label') <-  'time'
attr(foo$conc, 'label') <-  'concentration'
attr(foo$Subject, 'guide') <-  '////'
attr(foo$Wt, 'guide') <-  'kg'
attr(foo$Dose, 'guide') <-  'mg/kg'
attr(foo$Time, 'guide') <-  'h'
attr(foo$conc, 'guide') <-  'mg/L'
unpack(foo, pos = 1)
unpack(foo, pos = 2)
unpack(foo, pos = 3)
unpack(foo, pos = 4)
bar <- unpack(foo)
pack(bar)
attributes(pack(bar)$Subject)



