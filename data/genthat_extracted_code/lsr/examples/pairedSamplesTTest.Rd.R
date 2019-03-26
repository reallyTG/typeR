library(lsr)


### Name: pairedSamplesTTest
### Title: Paired samples t-test
### Aliases: pairedSamplesTTest

### ** Examples


# long form data frame
df <- data.frame(
       id = factor( x=c(1, 1, 2, 2, 3, 3, 4, 4), 
                    labels=c("alice","bob","chris","diana") ), 
       time = factor( x=c(1,2,1,2,1,2,1,2), 
                      labels=c("time1","time2")), 
       wm = c(3, 4, 6, 6, 9, 12,7,9) 
)
	
# wide form
df2 <- longToWide( df, wm ~ time )
	
# basic test, run from long form or wide form data	
pairedSamplesTTest( formula= wm ~ time, data=df, id="id" )
pairedSamplesTTest( formula= wm ~ time + (id), data=df )
pairedSamplesTTest( formula= ~wm_time1 + wm_time2, data=df2 ) 

# one sided test
pairedSamplesTTest( formula= wm~time, data=df, id="id", one.sided="time2" )

# missing data because of NA values
df$wm[1] <- NA
pairedSamplesTTest( formula= wm~time, data=df, id="id" )

# missing data because of missing cases from the long form data frame
df <- df[-1,] 
pairedSamplesTTest( formula= wm~time, data=df, id="id" )





