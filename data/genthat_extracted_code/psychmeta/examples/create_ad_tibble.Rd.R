library(psychmeta)


### Name: create_ad_tibble
### Title: Create a tibble of artifact distributions by construct
### Aliases: create_ad_tibble create_ad_list

### ** Examples

## Examples to create Taylor series artifact distributions:
# Overall artifact distributions (not pairwise, not moderated)
create_ad_tibble(ad_type = "tsa",
                 n = n, rxx = rxxi, ryy = ryyi,
                 construct_x = x_name, construct_y = y_name,
                 sample_id = sample_id, moderators = moderator,
                 data = data_r_meas_multi,
                 control = control_psychmeta(pairwise_ads = FALSE,
                                             moderated_ads = FALSE))

# Overall artifact distributions by moderator combination
create_ad_tibble(ad_type = "tsa",
                 n = n, rxx = rxxi, ryy = ryyi,
                 construct_x = x_name, construct_y = y_name,
                 sample_id = sample_id, moderators = moderator,
                 data = data_r_meas_multi,
                 control = control_psychmeta(pairwise_ads = FALSE,
                                             moderated_ads = TRUE))

# Pairwise artifact distributions (not moderated)
create_ad_tibble(ad_type = "tsa",
                 n = n, rxx = rxxi, ryy = ryyi,
                 construct_x = x_name, construct_y = y_name,
                 sample_id = sample_id, moderators = moderator,
                 data = data_r_meas_multi,
                 control = control_psychmeta(pairwise_ads = TRUE,
                                               moderated_ads = FALSE))

# Pairwise artifact distributions by moderator combination
create_ad_tibble(ad_type = "tsa",
                 n = n, rxx = rxxi, ryy = ryyi,
                 construct_x = x_name, construct_y = y_name,
                 sample_id = sample_id, moderators = moderator,
                 data = data_r_meas_multi,
                 control = control_psychmeta(pairwise_ads = TRUE,
                                             moderated_ads = TRUE))



