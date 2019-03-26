library(bigchess)


### Name: player_profile
### Title: Compute player profile
### Aliases: player_profile

### ** Examples

f <- system.file("extdata", "Kasparov.gz", package = "bigchess")
con <- gzfile(f,encoding = "latin1")
df <- read.pgn(con,quiet = TRUE,ignore.other.games = TRUE)
nrow(df) # 2109
df_pp <- player_profile(df,"Kasparov, Gary")
nrow(df_pp) # 1563
df_pp <- player_profile(df,"Kasparov,G")
nrow(df_pp) # 543
df_pp <- player_profile(df,"Kasparov, G\\.")
nrow(df_pp) # 2
df_pp <- player_profile(df,"Kasparov")
nrow(df_pp) # 2109 - correct
boxplot(P_Q_moves/NMoves~Player_Col,df_pp,
main = "Average Queen Moves\n Kasparov as Black (909 games) vs Kasparov as White (1200 games)",
col = c("black","white"),border = c("black","black"),notch = TRUE)
# Magnus Carlsen data example
f <- system.file("extdata", "Carlsen.gz", package = "bigchess")
con <- gzfile(f,encoding = "latin1")
df <- read.pgn(con,quiet = TRUE,ignore.other.games = TRUE)
nrow(df) # 2410
df_pp <- player_profile(df,"Carlsen")
nrow(df_pp) # 2411 - ??
# One game was played by Carlsen,H
df_pp <- player_profile(df,"Carlsen,M")
nrow(df_pp) # 2410 - correct



