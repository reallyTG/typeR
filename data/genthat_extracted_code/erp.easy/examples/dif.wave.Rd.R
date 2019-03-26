library(erp.easy)


### Name: dif.wave
### Title: Calculate a difference waveform from two data sets
### Aliases: dif.wave

### ** Examples

 # Calculate a difference wave
 Negative = ERPdata[1:6765, ]
 Neutral = ERPdata[6766:13530, ]
 refactor.neg <- factor(Negative$Stimulus)
 refactor.neut <- factor(Neutral$Stimulus)
 Negative$Stimulus <- refactor.neg
 Neutral$Stimulus <- refactor.neut
 difference <- dif.wave(Negative, Neutral, name = "Neg - Neut", keep = Neutral)
 head(difference) # view the new Stimulus column name
 grandaverage(difference, "V78") # plot the grand average difference wave




