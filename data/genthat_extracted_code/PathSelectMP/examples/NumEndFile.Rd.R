library(PathSelectMP)


### Name: NumEndFile
### Title: Extract Number From INP and OUT Files
### Aliases: NumEndFile
### Keywords: Parse helper

### ** Examples

## Don't show: 
NumEndFile<-function(NameoFile,pattern1,pattern2){
	#print(NameoFile[2])
	LocUse=grep(NameoFile,pattern=pattern1)
	Loc=gregexpr(pattern =pattern2,NameoFile[LocUse])[[1]][1]
	num=substr(NameoFile[LocUse],1,(Loc-2))
	#print(num)
	return(as.numeric(num))
	}
## End(Don't show)
files=c("new_1.out","new_10.out","new_11.out","new_12.out")
hh=lapply(strsplit(files,"_"),NumEndFile,pattern1=".out",pattern2="o")



