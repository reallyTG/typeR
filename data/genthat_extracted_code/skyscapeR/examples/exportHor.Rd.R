library(skyscapeR)


### Name: exportHor
### Title: Exports a _skyscapeR.horizon_ object into _Stellarium_ format
### Aliases: exportHor

### ** Examples

# Downloads horizon data from HeyWhatsThat and exports it into Stellarium:
hor <- download.HWT('HIFVTBGK')
exportHor(hor, name='Test', description='Test horizon export to Stellarium')



