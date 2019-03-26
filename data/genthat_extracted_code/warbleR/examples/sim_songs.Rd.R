library(warbleR)


### Name: sim_songs
### Title: Simulate animal vocalizations
### Aliases: sim_songs

### ** Examples

{
 # simulate a song with 3 elements and no harmonics
 sm_sng <- sim_songs(n = 3, harms = 1)
 
 # plot spectro
 seewave::spectro(sm_sng)
 
 # simulate a song with 5 elements and 2 extra harmonics
sm_sng2 <- sim_songs(n = 5, harms = 3)

 # plot spectro
 seewave::spectro(sm_sng2)
}




