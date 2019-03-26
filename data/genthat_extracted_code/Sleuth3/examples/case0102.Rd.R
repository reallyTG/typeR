library(Sleuth3)


### Name: case0102
### Title: Sex Discrimination in Employment
### Aliases: case0102
### Keywords: datasets

### ** Examples

attach(case0102)
str(case0102)   

boxplot(Salary ~ Sex, 
  ylab= "Starting Salary (U.S. Dollars)", 
  names=c("61 Females","32 Males"),
  main= "Harris Bank Entry Level Clerical Workers, 1969-1971")

hist(Salary[Sex=="Female"]) 
dev.new()
hist(Salary[Sex=="Male"])

t.test(Salary ~ Sex, var.equal=TRUE) # Equal var. version; 2-sided by default  
t.test(Salary ~ Sex, var.equal=TRUE, 
  alternative = "less")  # 1-sided; that group 1 (females) mean is less 
  
detach(case0102)  



