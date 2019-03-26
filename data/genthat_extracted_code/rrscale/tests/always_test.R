context("always")
set.seed(3251991)
A <- rlnorm(10)
B <- rlnorm(10)
Y <- t(t(B)) %*% t(A)
out <- rrscale(Y, trans_list = list(box_cox_negative = box_cox_negative, asinh = asinh), 
    lims_list = list(box_cox_negative = c(-100, 100), asinh = list(0, 100)), seed = 3251991, 
    verbose = FALSE, run_parallel = FALSE)
out2 <- out[c("pars", "par_hat", "NT", "RR", "G", "Z", "O", "T_name")]
expect_equal_to_reference(out2, "basic10_ref.rds", tolerance = 1e-05)
