library(qfasar)


### Name: cc_aug
### Title: Calibration coefficient for an augmented signature proportion
### Aliases: cc_aug

### ** Examples

cc_aug(sig_rep = matrix(c(0.05, 0.10, 0.30, 0.55,
                          0.04, 0.11, 0.29, 0.56,
                          0.10, 0.05, 0.35, 0.50), ncol = 3),
       sig_scale = matrix(c(0.40, 0.50, 0.10,
                            0.45, 0.49, 0.06,
                            0.35, 0.45, 0.20), ncol = 3),
       cc_all = c(0.75, 1.05, 1.86, 0.80),
       use_fa = c(FALSE, FALSE, TRUE, TRUE))

cc_aug(sig_rep = matrix(c(0.05, 0.10, 0.30, 0.55,
                          0.04, 0.11, 0.29, 0.56,
                          0.10, 0.05, 0.35, 0.50), ncol = 3),
       sig_scale = matrix(c(0.40, 0.50, 0.10,
                            0.45, 0.49, 0.06,
                            0.35, 0.45, 0.20), ncol = 3),
       cc_all = c(0.75, 1.05, 1.86, 0.80),
       use_fa = c(FALSE, FALSE, TRUE, TRUE),
       dist_meas = 1)

cc_aug(sig_rep = matrix(c(0.05, 0.10, 0.30, 0.55,
                          0.04, 0.11, 0.29, 0.56,
                          0.10, 0.05, 0.35, 0.50), ncol = 3),
       sig_scale = matrix(c(0.40, 0.50, 0.10,
                            0.45, 0.49, 0.06,
                            0.35, 0.45, 0.20), ncol = 3),
       cc_all = c(0.75, 1.05, 1.86, 0.80),
       use_fa = c(FALSE, FALSE, TRUE, TRUE),
       dist_meas = 2)

cc_aug(sig_rep = matrix(c(0.05, 0.10, 0.30, 0.55,
                          0.04, 0.11, 0.29, 0.56,
                          0.10, 0.05, 0.35, 0.50), ncol = 3),
       sig_scale = matrix(c(0.40, 0.50, 0.10,
                            0.45, 0.49, 0.06,
                            0.35, 0.45, 0.20), ncol = 3),
       cc_all = c(0.75, 1.05, 1.86, 0.80),
       use_fa = c(FALSE, FALSE, TRUE, TRUE),
       dist_meas = 3,
       gamma = 0.25)

cc_aug(sig_rep = matrix(c(0.05, 0.10, 0.30, 0.55,
                          0.04, 0.11, 0.29, 0.56,
                          0.10, 0.05, 0.35, 0.50), ncol = 3),
       sig_scale = matrix(c(0.40, 0.50, 0.10,
                            0.45, 0.49, 0.06,
                            0.35, 0.45, 0.20), ncol = 3),
       cc_all = c(0.75, 1.05, 1.86, 0.80),
       use_fa = c(FALSE, FALSE, TRUE, TRUE),
       dist_meas = 3)




