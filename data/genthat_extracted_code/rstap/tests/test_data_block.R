context("test internal coding functions")
f0 <- y ~ Age + Income
f1 <- y ~ sex + stap(Fast_Food)
f2 <- y ~ Age + stap(Fast_Food) + sap(Coffee_Shops)
f3 <- y ~ Age + stap(Fast_Food,cerf,exp) + sex + tap(Coffee_Shops)
f4 <- y ~ Age + stap(Fast_Food) + sex + (1|ID)
m3 <- rbind(c(2,3),c(0,1))
a1 <- c("Fast_Food"=2)
a2 <- c(a1,"Coffee_Shops"=0)
a3 <- c("Fast_Food"=2,"Coffee_Shops"=1)

test_that("correctly assigns weights",{
    expect_equal(get_weight_code(all.names(f1),'Fast_Food',c(2)),
                 matrix(c(2,1),nrow=1))
    expect_equal(get_weight_code(all.names(f2),c('Fast_Food',"Coffee_Shops"),c(2,0)),
                 matrix(c(c(2,2),c(1,0)),nrow=2))
    expect_equal(get_weight_code(all.names(f3),c("Fast_Food","Coffee_Shops"),c(2,1)),
                 m3)
    expect_equal(get_weight_code(all.names(f4),'Fast_Food',c(2)),
                 matrix(c(2,1),nrow=1))
})

test_that("correctly assigns stap coding",{
    expect_equal(get_stap_code(all.names(f1),'Fast_Food'),a1)
    expect_equal(get_stap_code(all.names(f2),c("Fast_Food","Coffee_Shops")),a2)
    expect_equal(get_stap_code(all.names(f3),c("Fast_Food","Coffee_Shops")),a3)
    expect_equal(get_stap_code(all.names(f4),"Fast_Food"),a1)
})

test_that("weight_switch works",{
    expect_equal(weight_switch(0),"none")
    expect_equal(weight_switch(1),"erf")
    expect_equal(weight_switch(2),"cerf")
    expect_equal(weight_switch(3),"exp")
    expect_equal(weight_switch(4),"cexp")
})

test_that("get_weight_name works",{
    expect_equal(get_weight_name(c(0,1)),list('spatial' = 'none',
                                              'temporal' = 'erf'))
    expect_equal(get_weight_name(c(2,0)),list("spatial" = "cerf",
                                              "temporal" = "none"))
    expect_equal(get_weight_name(c(2,3)), list("spatial" = "cerf",
                                               "temporal" = "exp"))
})

context("test stap data extraction functions")


f1 <- BMI ~ Age +  sap(Coffee_Shops)
f2 <- BMI ~ Age + tap(Coffee_Shops)
f3 <- BMI ~ Age + sap(Fast_Food)
f4 <- BMI ~ Age + stap(Coffee_Shops)
f5 <- BMI ~ Age + stap(Coffee_Shops)
distance_data <- data.frame(subj_id = c(1:10,1:10),
                            BEF = c(rep("Coffee_Shops",10),rep("Fast_Food",10)),
                            dist = rexp(20))
time_data <- data.frame(subj_id = c(1:10,1:10),
                        BEF = c(rep("Coffee_Shops",10),rep("Fast_Food",10)),
                        time = rexp(20))
subj_data <- data.frame(subj_id = 1:10,
                        BMI = rnorm(10,mean = 25, sd = 2),
                        Age = rnorm(10,mean = 35, sd = 10))
subj_data_long <- rbind(cbind(subj_data,measure_ID = as.integer(1)),
                        cbind(subj_data,measure_ID = as.integer(2)))
dist_data_long <- rbind(cbind(distance_data,measure_ID = as.integer(1) ),
                        cbind(distance_data,measure_ID = as.integer(2)))
time_data_long <- rbind(cbind(time_data,measure_ID = as.integer(1)),
                        cbind(time_data,measure_ID = as.integer(2)))
admat <- matrix(distance_data$dist[1:10],nrow=1)
rownames(admat) <- "Coffee_Shops"
admat2 <- matrix(distance_data$dist[11:20],nrow=1)
rownames(admat2) <- "Fast_Food"
admat4 <- matrix(time_data$time[1:10],nrow=1)
rownames(admat4) <- "Coffee_Shops"
a1 <-  list(d_mat = admat,
            t_mat = NA,
            u_s = as.array(cbind(1:10,1:10),dim=c(10,2,1)),
            u_t = NA,
            max_distance = max(distance_data$dist),
            max_time = NULL)
a2 <- list(d_mat = NA,
           t_mat = admat4,
           u_s = NA,
           u_t = as.array(cbind(1:10,1:10),dim=c(10,2,1)),
           max_distance = NULL,
           max_time = max(time_data$time))
a3 <- list(d_mat = admat2,
           t_mat = NA,
           u_s = as.array(cbind(1:10,1:10),dim=c(10,2,1)),
           u_t = NA,
           max_distance = max(distance_data$dist),
           max_time = NULL)
a4 <- list(d_mat = admat,
           t_mat = admat4,
           u_s = as.array(cbind(1:10,1:10),dim=c(10,2,1)),
           u_t = as.array(cbind(1:10,1:10),dim=c(10,2,1)),
           max_distance = max(distance_data$dist),
           max_time = max(time_data$time)
           )
a5 <- list(d_mat = cbind(admat,admat),
           t_mat = cbind(admat4,admat4),
           u_s = as.array(rbind(cbind(1:10,1:10),
                                cbind(11:20,11:20)),
                          dim = c(10,2,1)),
           u_t = as.array(rbind(cbind(1:10,1:10),
                                cbind(11:20,11:20)),
                          dim = c(10,2,1)),
           max_distance = max(distance_data$dist),
           max_time = max(time_data$time))

stap_data_1 <- extract_stap_data(f1)
stap_data_2 <- extract_stap_data(f2)
stap_data_3 <- extract_stap_data(f3)
stap_data_4 <- extract_stap_data(f4)
stap_data_5 <- extract_stap_data(f5)

test_that("extract_crs_data correctly errors when no distance or time data are given",{
    expect_error(extract_crs_data(formula = y ~ X,
                                         id_key = 'subj_id',
                                         max_distance = 3))
})

test_that("extract_crs_data correctly extracts data",{
    expect_equal(extract_crs_data(stap_data_1,
                                  subject_data = subj_data,
                                  distance_data = distance_data,
                                  time_data = NULL,
                                  id_key = 'subj_id',
                                  max_distance = max(distance_data$dist),
                                  max_time = NULL),
                 a1)
    expect_equal(extract_crs_data(stap_data_2,subj_data,
                                  distance_data = NULL,
                                  time_data = time_data,
                                  id_key = 'subj_id',
                                  max_distance = NULL,
                                  max_time = max(time_data$time)),
                 a2)
    expect_equal(extract_crs_data(stap_data_3,subj_data,
                                  distance_data = distance_data,
                                  time_data = NULL,
                                  id_key = 'subj_id',
                                  max_distance = max(distance_data$dist),
                                  max_time = NULL),
                 a3)
    expect_equal(extract_crs_data(stap_data_4,subject_data = subj_data,
                                  distance_data = distance_data,
                                  time_data = time_data,
                                  id_key ='subj_id',
                                  max_distance = max(distance_data$dist),
                                  max_time = max(time_data$time)),
                 a4)
    expect_equal(extract_crs_data(stap_data_5,
                                  subject_data = subj_data_long,
                                  distance_data = dist_data_long,
                                  time_data = time_data_long,
                                  id_key = c('subj_id','measure_ID'),
                                  max_distance = max(distance_data$dist),
                                  max_time = max(time_data$time)),a5)
})
p <- list(Coffee_Shop=list(spatial = normal(),
                           temporal = normal()),
          Fast_Food = list(spatial = normal()))
s <- c(2,0)
nms <- names(p)
a <- list(theta_s_dist = c(1,1),
          theta_s_scale = c(1,1),
          theta_s_mean = c(0,0),
          theta_s_df = c(0,0),
          theta_t_dist = c(1),
          theta_t_scale = c(1),
          theta_t_mean = c(0),
          theta_t_df = c(0))
p2 <- list(Coffee_Shop = list(spatial = normal(location = 2,
                                               scale = 3)))
s2 <- c(0)
nms2 <- names(p2)
a2 <- list(theta_s_dist = c(1),
           theta_s_scale = 3,
           theta_s_mean = 2,
           theta_s_df = 0)
p3 <- list(Coffee_Shop = list(aggregated = normal()))


test_that("handle_theta_stap_prior returns appropriate information",{
    expect_equal(handle_theta_stap_prior(p,ok_dists = c("normal","lognormal"), 
                                         default_scale = 1,
                                         stap_code = s, nms),a)
    expect_equal(handle_theta_stap_prior(p2,ok_dists = c("normal","lognormal"), 
                                         default_scale = 1,
                                         stap_code = s2, nms2),a2)
})