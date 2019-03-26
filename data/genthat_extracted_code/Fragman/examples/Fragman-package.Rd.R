library(Fragman)


### Name: Fragman-package
### Title: Fragment analysis and automatic scoring
### Aliases: Fragman
### Keywords: package

### ** Examples

## ================================= ##
## ================================= ##
## Fragment analysis requires 
## 1) loading your data
## 2) matching your ladder
## 3) define a panel for scoring
## 4) score the samples
## ================================= ##
## ================================= ##

#####################
## 1) Load your data
#####################

### you would use something like:
# folder <- "~/myfolder"
# my.plants <- storing.inds(folder)
### here we just load our sample data and use the first 2 plants

?my.plants
data(my.plants)
my.plants <- my.plants[1:2]
class(my.plants) <- "fsa_stored"
# plot(my.plants) # to visualize the raw data

#######################
## 2) Match your ladder
#######################

### create a vector indicating the sizes of your ladder and do the match

my.ladder <- c(50, 75, 100, 125, 129, 150, 175, 200, 225, 250, 275, 300, 325, 350, 375)
ladder.info.attach(stored=my.plants, ladder=my.ladder)

### matching your ladder is a critical step and should only happen once per batch of 
### samples read

###****************************************************************************************###
### OPTIONAL:
### If the ladder.info attach function detects some bad samples 
### that you can correct them manually using
### the ladder.corrector() function
### For example to correct one sample in the previous data
### ladder.corrector(stored=my.plants, 
#to.correct="FHN152-CPN01_01A_GH1x35_152-148-209_717-704-793_367-382-381.fsa", 
#ladder=my.ladder)
###****************************************************************************************###

#######################
## 3) Define a panel
#######################

### In fragment analysis you usually design a panel where you indicate
### which peaks are real. You may use the overview2 function which plots all the
### plants in the channel you want in the base pair range you want

overview2(my.inds=my.plants, channel = 2:3, ladder=my.ladder, init.thresh=5000)

### You can click on the peaks you think are real, given that the ones
### suggested by the program may not be correct. This can be done by using the 
### 'locator' function and press 'Esc' when you're done, i.e.:
# my.panel <- locator(type="p", pch=20, col="red")$x
### That way you can click over the peaks and get the sizes
### in base pairs stored in a vector named my.panel

### Just for demonstration purposes I will use the suggested peaks by 
### the program using overview2, which will return a vector with 
### expected DNA sizes to be used in the next step for scoring
### we'll do it in the 160-190 bp region

my.panel <- overview2(my.inds=my.plants, channel = 3, 
                    ladder=my.ladder, init.thresh=7000, 
                    xlim=c(160,190)); my.panel

##########################
## 4) Score the samples
##########################

### When a panel is created is time to score the samples by providing the initial
### data we read, the ladder vector, the panel vector, and our specifications
### of channel to score (other arguments are available)

### Here we will score our samples for channel 3 with our panel created previously

res <- score.markers(my.inds=my.plants, channel = 3, panel=my.panel$channel_3,
                ladder=my.ladder, electro=FALSE)

### Check the plots and make sure they were scored correctly. In case some samples 
### are wrong you might want to use the locator function again and figure out 
### the size of your peaks. To extract your peaks in a data.frame do the following:

final.results <- get.scores(res)
final.results 



