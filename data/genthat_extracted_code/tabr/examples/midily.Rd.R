library(tabr)


### Name: midily
### Title: Convert MIDI to LilyPond file
### Aliases: midily

### ** Examples

if(tabr_options()$midi2ly != ""){
  midi <- system.file("example.mid", package = "tabr")
  outfile <- file.path(tempdir(), "out.ly")
  midily(midi, outfile) # requires LilyPond installation
}



