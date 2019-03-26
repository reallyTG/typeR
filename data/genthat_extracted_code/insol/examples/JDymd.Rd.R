library(insol)


### Name: JDymd
### Title: Julian Day from yyyy, mm, dd
### Aliases: JDymd

### ** Examples

JDymd(2019,3,20,12)

print(paste('Number of days since the beginning of the century (1/1/2001):',
	JD(Sys.time())-JDymd(2001,1,1,0)))



