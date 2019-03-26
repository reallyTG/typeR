library(PBSmapping)


### Name: importGSHHS
### Title: Import Data from a GSHHS Database
### Aliases: importGSHHS
### Keywords: file

### ** Examples

## Not run: 
##D useWest=FALSE
##D useVers=c("2.2.0","2.2.3","2.3.0","2.3.4") # GSHHG versions
##D mapswitch = 5
##D for (i in c("land","rivers","borders"))
##D   if (exists(i)) eval(parse(text=paste0("rm(",i,")")))
##D switch( mapswitch,
##D  # 1. Canada------------------------------------------------
##D       {vN=4; useWest=T; xlim=c(-150,-50)+360;ylim=c(40,75)},
##D  # 2. NW Canada & America-----------------------------------
##D       {vN=4; useWest=T;xlim=c(-136,-100)+360;ylim=c(40,75)},
##D  # 3. Black Sea (user Ivailo)-------------------------------
##D       {vN=4; xlim=c(27.5, 34.3); ylim=c(40.9, 46.7)},
##D  # 4. W Europe, NW Africa (user Uli)------------------------
##D       {vN=4; xlim=c(-20,10); ylim=c(20,50)},
##D  # 5. W Europe + Iceland------------------------------------
##D       {vN=4; xlim=c(-25, 20); ylim=c(40, 68)},
##D  # 6. New Zealand-------------------------------------------
##D       {vN=4; xlim=c(163, 182); ylim=c(-48,-34)},
##D  # 7. Australia---------------------------------------------
##D       {vN=4; xlim=c(112,155); ylim=c(-44,-10)},
##D  # 8. Japan-------------------------------------------------
##D       {vN=4; xlim=c(127,148); ylim=c(30,47)},
##D  # 9. Central America---------------------------------------
##D       {vN=4; useWest=T; xlim=c(-95,-60)+360;ylim=c(-10,25)},
##D  #10. North Pacific-----------------------------------------
##D       {vN=4; useWest=T; xlim=c(150,220); ylim=c(45,80)},
##D  #11. Pacific Ocean-----------------------------------------
##D       {vN=4; xlim=c(112,240); ylim=c(-48,80)},
##D  #12. North Atlantic (world coordinates)--------------------
##D       {vN=4; xlim=c(285,360); ylim=c(40,68)},
##D  #13. North Atlantic (western hemisphere coordinates)-------
##D       {vN=4; xlim=c(-75,0); ylim=c(40,68)},
##D  #14. Atlantic Ocean----------------------------------------
##D       {vN=4; xlim=c(285,380); ylim=c(-50,68)},
##D  #15. Northern hemisphere-----------------------------------
##D       {vN=4; xlim=c(-180,180); ylim=c(0,85)},
##D  #16. Asia--------------------------------------------------
##D       {vN=4; xlim=c(0,180); ylim=c(0,80)},
##D  #17. North America-----------------------------------------
##D       {vN=4; xlim=c(-180,0); ylim=c(0,80)},
##D  #18. International date line-------------------------------
##D       {vN=4; xlim=c(45,315); ylim=c(0,80)},
##D  #19. Indian Ocean------------------------------------------
##D       {vN=4; xlim=c(20,130); ylim=c(-40,40)},
##D  #20. Moose County ("400 miles north of everywhere")--------
##D       {vN=4; xlim=c(272.5,280.5); ylim=c(43,47.5)}
##D )
##D db=paste0("gshhg-bin-",useVers[vN])        # database version folder
##D gshhg   = paste0("C:/Ruser/GSHHG/",db,"/") # directory with binary files
##D land    = importGSHHS(paste0(gshhg,"gshhs_i.b"),
##D           xlim=xlim,ylim=ylim,maxLevel=4,useWest=useWest)
##D rivers  = importGSHHS(paste0(gshhg,"wdb_rivers_i.b"),
##D           xlim=xlim,ylim=ylim,useWest=useWest)
##D borders = importGSHHS(paste0(gshhg,"wdb_borders_i.b"),
##D           xlim=xlim,ylim=ylim,useWest=useWest,maxLevel=1)
##D if(exists("land")){
##D   plotMap(land,xlim=xlim-ifelse(useWest,360,0),ylim=ylim,
##D     col="lemonchiffon",bg="aliceblue")
##D   if(!is.null(rivers)) addLines(rivers,col="blue")
##D   if(!is.null(borders)) addLines(borders,col="red",lwd=2)
##D }
## End(Not run)



