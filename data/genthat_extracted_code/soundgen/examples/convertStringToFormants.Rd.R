library(soundgen)


### Name: convertStringToFormants
### Title: Prepare a list of formants
### Aliases: convertStringToFormants
### Keywords: internal

### ** Examples

formants = soundgen:::convertStringToFormants(phonemeString = 'a')
formants = soundgen:::convertStringToFormants(
  phonemeString = 'au', speaker = 'M1')
formants = soundgen:::convertStringToFormants(
  phonemeString = 'aeui', speaker = 'F1')
formants = soundgen:::convertStringToFormants(
  phonemeString = 'aaeuiiiii', speaker = 'Chimpanzee')



