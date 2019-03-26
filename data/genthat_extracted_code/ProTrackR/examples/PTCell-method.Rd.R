library(ProTrackR)


### Name: PTCell-method
### Title: Coerce to or replace PTCell
### Aliases: PTCell-method PTCell,raw,missing,missing,missing-method
###   PTCell,character,missing,missing,missing-method
###   PTCell,PTModule,numeric,numeric,numeric-method PTCell<-
###   PTCell<-,PTModule,numeric,numeric,numeric,PTCell-method
###   PTCell,PTPattern,numeric,numeric,missing-method
###   PTCell<-,PTPattern,numeric,numeric,missing,PTCell-method
###   PTCell,PTTrack,numeric,missing,missing-method
###   PTCell<-,PTTrack,numeric,missing,missing,PTCell-method
###   PTCell<-,PTTrack,numeric,missing,missing-method

### ** Examples

## This will create an empty PTCell (equivalent
## to new("PTCell"):
PTCell(raw(4))

## Use a character representation to create
## a new PTCell object. A cell with note
## B in octave 2, sample number 10 and with
## effect '105':
cell <- PTCell("B-2 0A 105")

data("mod.intro")

## replace PTCell at pattern number 1, track
## number 2, and row number 3:
PTCell(mod.intro, 3, 2, 1) <- cell




