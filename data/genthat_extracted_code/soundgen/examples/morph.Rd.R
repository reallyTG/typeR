library(soundgen)


### Name: morph
### Title: Morph sounds
### Aliases: morph

### ** Examples

# write two formulas or copy-paste them from soundgen_app() or presets:
playback = c(TRUE, FALSE)[2]
# [a] to barking
m = morph(formula1 = list(repeatBout = 2),
          # equivalently: formula1 = 'soundgen(repeatBout = 2)',
          formula2 = presets$Misc$Dog_bark,
          nMorphs = 5, playMorphs = playback)
 # use $formulas to access formulas for each morph, $sounds for waveforms
 # m$formulas[[4]]
 # playme(m$sounds[[3]])

## Not run: 
##D # morph intonation and vowel quality
##D m = morph(
##D   'soundgen(pitch = c(300, 250, 400), formants = c(350, 2900, 3600, 4700))',
##D   'soundgen(pitch = c(300, 700, 500, 300), formants = c(800, 1250, 3100, 4500))',
##D   nMorphs = 5, playMorphs = playback
##D )
##D 
##D # from a grunt of disgust to a moan of pleasure
##D m = morph(
##D   formula1 = 'soundgen(sylLen = 180, pitch = c(160, 160, 120), rolloff = -12,
##D     nonlinBalance = 70, subFreq = 75, subDep = 35, jitterDep = 2,
##D     formants = c(550, 1200, 2100, 4300, 4700, 6500, 7300),
##D     noise = data.frame(time = c(0, 180, 270), value = c(-25, -25, -40)),
##D     rolloffNoise = 0)',
##D   formula2 = 'soundgen(sylLen = 320, pitch = c(340, 330, 300),
##D     rolloff = c(-18, -16, -30), ampl = c(0, -10), formants = c(950, 1700, 3700),
##D     noise = data.frame(time = c(0, 300, 440), value = c(-35, -25, -65)),
##D     mouth = c(.4, .5), rolloffNoise = -5, attackLen = 30)',
##D   nMorphs = 8, playMorphs = playback
##D )
## End(Not run)



