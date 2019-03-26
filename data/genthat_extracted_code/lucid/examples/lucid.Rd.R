library(lucid)


### Name: lucid
### Title: Lucid printing
### Aliases: lucid lucid.default lucid.numeric lucid.data.frame
###   lucid.matrix lucid.list lucid.tbl_df

### ** Examples


x0 <- c(123, 12.3, 1.23, .123456) # From Finney, page 352
print(x0)
lucid(x0, dig=2)

x1 <- c(123, NA, 1.23, NA)
lucid(x1, na.value="--")

signif(mtcars[15:20,])
lucid(mtcars[15:20,])

x2 <- c(1/3, 5/3, 1, 1.5, 2, 11/6, 5/6, 8.43215652105343e-17)
print(x2)
lucid(x2)

# Which coef is 0 ? How large is the intercept?
df1 <- data.frame(effect=c(-13.5, 4.5,  24.5, 6.927792e-14, -1.75,
                    16.5, 113.5000))
rownames(df1) <- c("A","B","C","C1","C2","D","(Intercept)")
print(df1)
lucid(df1)

# Which are smallest/largest/significant variance components
df2 <- data.frame(effect=c("hyb","region","region:loc","hyb:region",
                           "yr","hyb:yr","region:yr","R!variance"),
                  component=c(10.9,277,493,1.30E-04,126,22.3,481,268),
                  std.error=c(4.40,166,26.1,1.58E-06,119,4.50,108,3.25),
                  z.ratio=c(2.471,1.669,18.899,82.242,1.060,4.951,4.442,82.242),
constraint=c("pos","pos","pos","bnd","pos","pos","pos","pos"))
print(df2)
lucid(df2)




