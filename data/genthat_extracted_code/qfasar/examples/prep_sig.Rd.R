library(qfasar)


### Name: prep_sig
### Title: Prepare fatty acid signature data for analysis
### Aliases: prep_sig

### ** Examples

prep_sig(df_sig = data.frame(type = c("Type_1", "Type_1", "Type_2",
                                      "Type_2"),
                             id = c("ID_1", "ID_2", "ID_3", "ID_4"),
                             fa_1 = c(0.0, 0.2, 0.3, 0.6),
                             fa_2 = c(0.1, 0.3, 0.3, 0.4),
                             fa_3 = c(0.9, 0.5, 0.4, NA),
                             row.names = c("Prey_1", "Prey_2", "Prey_3",
                                           "Prey_4")),
         fa_names = c("fa_1", "fa_2", "fa_3"),
         use_fa = c(TRUE, FALSE, TRUE),
         zero_rep = 0.0001,
         scale=2)

prep_sig(df_sig = data.frame(type = c("Type_1", "Type_1", "Type_2",
                                      "Type_2"),
                             id = c("ID_1", "ID_2", "ID_3", "ID_4"),
                             fa_1 = c(0.0, 0.2, 0.3, 0.6),
                             fa_2 = c(0.1, 0.3, 0.3, 0.4),
                             fa_3 = c(0.9, 0.5, 0.4, NA),
                             row.names = c("Prey_1", "Prey_2", "Prey_3",
                                           "Prey_4")),
         fa_names = c("fa_1", "fa_2", "fa_3"),
         use_fa = c(TRUE, FALSE, TRUE),
         zero_rep = 90,
         scale=1)

prep_sig(df_sig = data.frame(type = c("Type_1", "Type_1", "Type_2",
                                      "Type_2"),
                             id = c("ID_1", "ID_2", "ID_3", "ID_4"),
                             fa_1 = c(0.0, 0.2, 0.3, 0.6),
                             fa_2 = c(0.1, 0.3, 0.3, 0.4),
                             fa_3 = c(0.9, 0.5, 0.4, NA),
                             row.names = c("Prey_1", "Prey_2", "Prey_3",
                                           "Prey_4")),
         fa_names = c("fa_1", "fa_2", "fa_3"),
         use_fa = c(TRUE, FALSE, TRUE),
         scale=3)

prep_sig(df_sig = data.frame(type = c("Type_1", "Type_1", "Type_2",
                                      "Type_2"),
                             id = c("ID_1", "ID_2", "ID_3", "ID_4"),
                             fa_1 = c(0.0, 0.2, 0.3, 0.6),
                             fa_2 = c(0.1, 0.3, 0.3, 0.4),
                             fa_3 = c(0.9, 0.5, 0.4, NA),
                             row.names = c("Prey_1", "Prey_2", "Prey_3",
                                           "Prey_4")),
         fa_names = c("fa_1", "fa_2", "fa_3"),
         use_fa = c(TRUE, FALSE, TRUE))




