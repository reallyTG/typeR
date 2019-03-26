set.seed(19970224)
nt = 100
n = 100
d = 200
p = 3
m = d * p
t = 3

library(splines)


X = 0.5*matrix(runif(n*d),n,d) + matrix(rep(0.5*runif(n),d),n,d)
y = -2*sin(X[,1]) + X[,2]^2-1/3 + X[,3]-1/2 + exp(-X[,4])+exp(-1)-1



genZ_t = proc.time()
Z = matrix(0,n,m)
for(j in 1:d){
  tmp = (j-1)*p + c(1:p)
  tmp0 = ns(X[,j],df=p)
  Z[,tmp] = tmp0
}

Z <-cbind(rep(1, n), Z)
colnames(Z) <- c("Intercept", paste("X", 1:m, sep = ""))

genZ_t = proc.time() - genZ_t

Xt = 0.5*matrix(runif(nt*d),nt,d) + matrix(rep(0.5*runif(nt),d),nt,d)
yt = -2*sin(Xt[,1]) + Xt[,2]^2-1/3 + Xt[,3]-1/2 + exp(-Xt[,4])+exp(-1)-1

Zt = matrix(0,nt,m)
for(j in 1:d){
  tmp = (j-1)*p + c(1:p)
  tmp0 = ns(Xt[,j],df=p)
  Zt[,tmp] = tmp0
}

Zt <-cbind(rep(1, n), Zt)
colnames(Zt) <- c("Intercept", paste("X", 1:m, sep = ""))

index <- NA
for (i in 1:d) {
  index <- c(index, rep(i, p))
}

# SAM

library(SAM)

total_t = 0
total_l = 0
nlamb = 30
for (i in 1:t) {
  t0 = proc.time()
  out.trn = samQL(X, y, nlambda=nlamb)
  total_t = total_t + proc.time() - t0
  out.tst = predict(out.trn, Xt)
  total_l = total_l + mean((out.tst$values[,nlamb]-yt)^2/2)
}
print("sam lin-reg:")
print(total_t / t - genZ_t)
print(total_l / t)


total_t = 0
total_l = 0
nlamb = 30
for (i in 1:t) {
  t0 = proc.time()
  out.trn = samQL(X, y, nlambda=nlamb, regfunc="MCP")
  total_t = total_t + proc.time() - t0
  out.tst = predict(out.trn, Xt)
  total_l = total_l + mean((out.tst$values[,nlamb]-yt)^2/2)
}
print("sam lin-reg with MCP:")
print(total_t / t - genZ_t)
print(total_l / t)

