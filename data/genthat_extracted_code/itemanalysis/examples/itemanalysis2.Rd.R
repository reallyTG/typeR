library(itemanalysis)


### Name: itemanalysis2
### Title: Classical Test Theory Item Analysis for Polytomous Items
### Aliases: itemanalysis2

### ** Examples


    data(timss2011_usa)

    timss2011_usa$Q14B <- recode(var = timss2011_usa$Q14B,
                                 recodes = "c(0)=3;c(1)=2;c(2)=1;c(3)=0")

    timss2011_usa$Q14C <- recode(var = timss2011_usa$Q14C,
                                 recodes = "c(0)=3;c(1)=2;c(2)=1;c(3)=0")

    item.analysis <- itemanalysis2(data=timss2011_usa,
                                   options=c(0,1,2,3),
                                   ngroup=18,
                                   correction=FALSE)

    # item.analysis$plots[[1]]   # Item Trace Line for the first item
    # item.analysis$plots[[2]]   # Item Trace Line for the second item
    # item.analysis$plots[[3]]   # Item Trace Line for the third item
    # item.analysis$plots[[4]]   # Item Trace Line for the fourth item
    # item.analysis$plots[[5]]   # Item Trace Line for the fifth item
    # item.analysis$plots[[6]]   # Item Trace Line for the sixth item




