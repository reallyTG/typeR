library(soundgen)


### Name: soundgen
### Title: Generate a sound
### Aliases: soundgen

### ** Examples

# NB: GUI for soundgen is available as a Shiny app.
# Type "soundgen_app()" to open it in default browser

playback = c(TRUE, FALSE)[2]  # set to TRUE to play back the audio from examples

sound = soundgen(play = playback)
# spectrogram(sound, 16000, osc = TRUE)
# playme(sound)

# Control of intonation, amplitude envelope, formants
s0 = soundgen(
  pitch = c(300, 390, 250),
  ampl = data.frame(time = c(0, 50, 300), value = c(-5, -10, 0)),
  attack = c(10, 50),
  formants = c(600, 900, 2200),
  play = playback
)

# Use the in-built collection of presets:
# names(presets)  # speakers
# names(presets$Chimpanzee)  # calls per speaker
s1 = eval(parse(text = presets$Chimpanzee$Scream_conflict))  # screaming chimp
# playme(s1)
s2 = eval(parse(text = presets$F1$Scream))  # screaming woman
# playme(s2)
## Not run: 
##D # unless temperature is 0, the sound is different every time
##D for (i in 1:3) sound = soundgen(play = playback, temperature = .2)
##D 
##D # Bouts versus syllables. Compare:
##D sound = soundgen(formants = 'uai', repeatBout = 3, play = playback)
##D sound = soundgen(formants = 'uai', nSyl = 3, play = playback)
##D 
##D # Intonation contours per syllable and globally:
##D sound = soundgen(nSyl = 5, sylLen = 200, pauseLen = 140,
##D   play = playback, pitch = data.frame(
##D     time = c(0, 0.65, 1), value = c(977, 1540, 826)),
##D   pitchGlobal = data.frame(time = c(0, .5, 1), value = c(-6, 7, 0)))
##D 
##D # Subharmonics in sidebands (noisy scream)
##D sound = soundgen (nonlinBalance = 100, subFreq = 75, subDep = 130,
##D   pitch = data.frame(
##D     time = c(0, .3, .9, 1), value = c(1200, 1547, 1487, 1154)),
##D   sylLen = 800,
##D   play = playback, plot = TRUE)
##D 
##D # Jitter and mouth opening (bark, dog-like)
##D sound = soundgen(repeatBout = 2, sylLen = 160, pauseLen = 100,
##D   nonlinBalance = 100, subFreq = 100, subDep = 60, jitterDep = 1,
##D   pitch = c(559, 785, 557),
##D   mouth = c(0, 0.5, 0),
##D   vocalTract = 5, play = playback)
##D 
##D # Use nonlinRandomWalk to crease reproducible examples of sounds with
##D nonlinear effects. For ex., to make a sound with no effect in the first
##D third, subharmonics in the second third, and jitter in the final third of the
##D total duration:
##D a = c(rep(0, 100), rep(1, 100), rep(2, 100))
##D s = soundgen(sylLen = 800, pitch = 300, temperature = 0.001,
##D              subFreq = 100, subDep = 70, jitterDep = 1,
##D              nonlinRandomWalk = a, plot = TRUE, ylim = c(0, 4))
##D # playme(s)
##D 
##D # See the vignette on sound generation for more examples and in-depth
##D # explanation of the arguments to soundgen()
##D # Examples of code for creating human and animal vocalizations are available
##D # on project's homepage: http://cogsci.se/soundgen.html
## End(Not run)



