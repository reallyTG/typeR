library(deaR)


### Name: rts
### Title: RTS
### Aliases: rts

### ** Examples

 data("Coll_Blasco_2006")
 data_example <- read_data(Coll_Blasco_2006,
                           dmus=1, 
                           ni=2, 
                           no=2)
 result <- model_basic(data_example, 
                       orientation="io", 
                       rts="crs")
 rts(result)
 



