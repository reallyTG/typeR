library(BAwiR)


### Name: get_similar_teams
### Title: Similar teams to archetypoids
### Aliases: get_similar_teams

### ** Examples

## Not run: 
##D (s0 <- Sys.time())
##D library(Anthropometry)
##D df <- do_join_games_bio("ACB", acb_games_1718, acb_players_1718)
##D df$Compet <- "ACB"
##D df_teams <- do_stats_teams(df, "2017-2018", "ACB", "Regular Season")
##D df_team_total <- df_teams$df_team_total
##D 
##D df3 <- df_team_total[, c("PTS", "PTSrv", "Team")]
##D preproc <- preprocessing(df3[,1:2], stand = TRUE, percAccomm = 1)
##D set.seed(4321)
##D lass <- stepArchetypesRawData(preproc$data, 1:2, numRep = 20, verbose = FALSE)
##D res <- archetypoids(2, preproc$data, huge = 200, step = FALSE, ArchObj = lass,
##D                     nearest = "cand_ns", sequ = TRUE)
##D cases <- anthrCases(res)
##D df3[cases,]
##D alphas <- round(res$alphas, 4)
##D 
##D get_similar_teams(1, 0.95, alphas, cases, df_team_total, c("PTS", "PTSrv"))
##D s1 <- Sys.time() - s0
##D s1
## End(Not run)                     




