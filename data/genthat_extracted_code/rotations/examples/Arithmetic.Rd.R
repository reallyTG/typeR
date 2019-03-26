library(rotations)


### Name: Arithmetic
### Title: Arithmetic operators on SO(3)
### Aliases: "+.Q4" "+.SO3" "-.Q4" "-.SO3" +.Q4 +.SO3 -.Q4 -.SO3 Arithmetic

### ** Examples

U <- c(1, 0, 0)          #Rotate about the x-axis
R1 <- as.SO3(U, pi/8)    #Rotate pi/8 radians about the x-axis
R2 <- R1 + R1            #Rotate pi/8 radians about the x-axis twice
mis.axis(R2)             #x-axis: (1,0,0)
mis.angle(R2)            #pi/8 + pi/8 = pi/4

R3 <- R1 - R1            #Rotate pi/8 radians about x-axis then back again
R3                       #Identity matrix

R4 <- -R1                #Rotate in the opposite direction through pi/8
R5 <- as.SO3(U, -pi/8)   #Equivalent to R4

M1 <- matrix(R1, 3, 3)   #If element-wise addition is requred,
M2 <- matrix(R2, 3, 3)   #translate them to matrices then treat as usual
M3 <- M1 + M2

M1 %*% M1                #Equivalent to R2
t(M1) %*% M1             #Equivalent to R3
t(M1)                    #Equivalent to R4 and R5

#The same can be done with quaternions: the identity rotation is (1, 0, 0, 0)
#and the inverse rotation of Q=(a, b, c, d) is -Q=(a, -b, -c, -d)

Q1 <- as.Q4(R1)
Q2 <- Q1 + Q1
mis.axis(Q2)
mis.angle(Q2)

Q1 - Q1                  #id.Q4 = (1, 0, 0, 0)



