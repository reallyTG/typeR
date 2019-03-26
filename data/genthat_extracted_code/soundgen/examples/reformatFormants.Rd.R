library(soundgen)


### Name: reformatFormants
### Title: Reformat formants
### Aliases: reformatFormants
### Keywords: internal

### ** Examples

formants = soundgen:::reformatFormants('aau')
formants = soundgen:::reformatFormants(c(500, 1500, 2500))
formants = soundgen:::reformatFormants(list(f1 = 500, f2 = c(1500, 1700)))
formants = soundgen:::reformatFormants(list(
     f1 = list(freq = 800, amp = 30),
     f2 = list(freq = c(1500, 1700, 2200), width = c(100, 150, 175))
))



