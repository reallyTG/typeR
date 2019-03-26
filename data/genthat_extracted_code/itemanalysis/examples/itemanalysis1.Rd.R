library(itemanalysis)


### Name: itemanalysis1
### Title: Classical Test Theory Item Analysis for Multiple-Choice Test
###   Items
### Aliases: itemanalysis1

### ** Examples


    data(dichotomous)
    head(dichotomous)
    str(dichotomous)

    # Key response vector

    key <- c("A","D","C","B","C","B","C","D","A","D","C","A","D","C","A",
            "B","D","B","A","C","A","A","C","B","C","B","D","A","A","A",
            "C","B","B","A","B","D","D","A","D","C","D","A","B","B","C",
            "D","B","C","C","B","D","A","C","B","A","D")

    # Use itemanalysis1 function to run the item analysis

      # In order to reduce running time for the example below,
      # I specify "data=dichotomous[,1:10]", so it only analyze the 
      # first 10 items.
      # You should specify "data=dichotomous" to analyze based on 56 items.

    item.analysis <- itemanalysis1(data=dichotomous[,1:10],
                           key=key,
                           options=c("A","B","C","D"),
                           ngroup=10,
                           correction=FALSE)

    # item.analysis$plots[[1]]   # Item Trace Line for the first item
    # item.analysis$plots[[2]]   # Item Trace Line for the second item
    # item.analysis$plots[[3]]   # Item Trace Line for the third item
    # item.analysis$plots[[4]]   # Item Trace Line for the fourth item
    # item.analysis$plots[[5]]   # Item Trace Line for the fifth item
    # item.analysis$plots[[6]]   # Item Trace Line for the sixth item
    # item.analysis$plots[[7]]   # Item Trace Line for the seventh item
    # item.analysis$plots[[8]]   # Item Trace Line for the eigth item
    # item.analysis$plots[[9]]   # Item Trace Line for the ninth item
    # item.analysis$plots[[10]]  # Item Trace Line for the tenth item




