library(catlearn)


### Name: stsimGCM
### Title: Generalized Context Model
### Aliases: stsimGCM

### ** Examples


    ## Three Categories with 2 Training Items each, and repeatedly presented
    ## transfer/test items (from nosof94train()). Each item has three 
    ## features with two (binary) values: memory strength (st$mp and 
    ## 'mem' column in st$training_items are optional) is 
    ## equal for all exemplars
    
    st<-list(
        sensitivity = 3,
        weights = c(.2,.3),
        choice_bias = c(1/3),
        gamma = 1,
        mp = 1,
        r_metric = 1,
        p = 1,
        nCats = 2,
        nFeat=3
    )
    
    ## training item definitions 
    st$training_items <- as.data.frame(
        t(matrix(cbind(c(1,0,1,1,1,0,0),c(1,1,0,2,1,0,0),
                       c(0,1,0,5,0,1,0),c(0,0,1,1,0,1,0)),
                 ncol=4, nrow=7,
                 dimnames=list(c("stim","x1", "x2", "x3",
                                 "cat1", "cat2", "mem"),
                               c(1:4)))))
                               
    st$tr <- nosof94train()
    
    ## get the resulting predictions for the test items
    
    ## columns of the output correspond to category numbers as defined
    ## above rows correspond to the column indices of the test_items
    
    stsimGCM(st)

    ## columns of the output correspond to category numbers as defined
    ## above rows correspond to the column indices of the test_items

    ## Example 2

    ## Same (settings) as above, except: memory strength is 5 times higher
    ## for for some exemplars
    st$mp<-5
    
    ## which exemplars?
    ## training item definitions 
    st$training_items <- as.data.frame(
        t(matrix(cbind(c(1,0,1,1,1,0,1),c(1,1,0,2,1,0,0),
                       c(0,1,0,5,0,1,0),c(0,0,1,1,0,1,1)),
                 ncol=4, nrow=7,
                 dimnames=list(c("stim","x1", "x2", "x3",
                                 "cat1", "cat2", "mem"),
                               c(1:4)))))
    ## exemplars in row 1 and 4 will receive a memory strength of 5
    ## get predictions
    stsimGCM(st)

    ## Example 3 
    ## Same (settings) as above, except: memory strength is item specific
    ## for the two exemplars i.e. memory strength boost is not the same 
    ## for both exemplars (3 for the first in row 1, and 5 for the 
    ## second exemplar in row 4)
    st$mp<-c(3,5) 


    ## get predictions
    stsimGCM(st)



