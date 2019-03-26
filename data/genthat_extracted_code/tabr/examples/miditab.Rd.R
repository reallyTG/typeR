library(tabr)


### Name: miditab
### Title: Convert MIDI to tablature
### Aliases: miditab

### ** Examples

if(tabr_options()$midi2ly != ""){
  midi <- system.file("example.mid", package = "tabr")
  outfile <- file.path(tempdir(), "out.pdf")
  miditab(midi, outfile, details = FALSE) # requires LilyPond installation
}



